#!/usr/bin/env ruby
# quiet-rspec runner
#
# Runs RSpec with a dedicated JSON output file, discarding the app's own
# stdout/stderr noise, then prints a compact summary of results.
#
# Usage:
#   ruby run_rspec.rb [--working-dir=PATH] [--full] [RSPEC_ARGS...]
#   ruby run_rspec.rb [--working-dir PATH] [--full] [--] [RSPEC_ARGS...]
#
# Options:
#   --working-dir PATH   Directory to run RSpec from (default: current dir)
#   --full, --verbose    Show full backtrace for each failure
#   --                   Separator: everything after goes to RSpec verbatim

require 'tmpdir'
require 'json'
require 'open3'
require 'shellwords'

working_dir = Dir.pwd
verbose = false
rspec_args = []

args = ARGV.dup
until args.empty?
  arg = args.shift
  case arg
  when '--'
    rspec_args.concat(args)
    break
  when '--full', '--verbose'
    verbose = true
  when '--working-dir'
    working_dir = args.shift || (abort 'quiet-rspec: --working-dir requires a value')
  when /\A--working-dir=(.*)\z/
    working_dir = $1
  else
    rspec_args << arg
    rspec_args.concat(args)
    break
  end
end

unless Dir.exist?(working_dir)
  warn "quiet-rspec: directory not found: #{working_dir}"
  exit 1
end

use_bundler = File.exist?(File.join(working_dir, 'Gemfile'))
rspec_bin   = use_bundler ? 'bundle exec rspec' : 'rspec'

json_file  = File.join(Dir.tmpdir, "qrspec_json_#{Process.pid}.json")
noise_file = File.join(Dir.tmpdir, "qrspec_noise_#{Process.pid}.txt")

begin
  cmd = "#{rspec_bin} --format json --out #{Shellwords.escape(json_file)} #{rspec_args.join(' ')}"

  noise_lines = []
  exit_status = nil

  Dir.chdir(working_dir) do
    Open3.popen2e(cmd) do |_stdin, stdout_err, wait_thr|
      stdout_err.each_line do |line|
        noise_lines << line
        noise_lines.shift if noise_lines.length > 200
      end
      exit_status = wait_thr.value.exitstatus
    end
  end

  if File.exist?(json_file) && File.size(json_file) > 0
    raw = File.read(json_file)
    data = JSON.parse(raw)

    summary  = data['summary'] || {}
    examples = data['examples'] || []
    messages = data['messages'] || []
    failed   = examples.select { |e| e['status'] == 'failed' }
    errors_outside = summary['errors_outside_of_examples_count'].to_i

    duration = summary['duration'] ? "#{summary['duration'].round(2)}s" : '?s'
    summary_line = "#{summary['example_count']} examples, #{summary['failure_count']} failures, " \
                   "#{summary['pending_count']} pending"
    summary_line += ", #{errors_outside} error(s) outside examples" if errors_outside > 0
    summary_line += " — #{duration}"
    puts summary_line

    if errors_outside > 0 && !messages.empty?
      puts ''
      puts 'Errors outside examples:'
      messages.each do |msg|
        lines = msg.to_s.lines.map(&:strip).reject(&:empty?)
        puts "  #{lines.first}"
        lines[1..4].each { |l| puts "    #{l}" } if verbose
      end
    end

    unless failed.empty?
      puts ''
      puts 'Failures:'
      failed.each_with_index do |ex, i|
        puts ''
        puts "  #{i + 1}) #{ex['full_description']}"
        puts "     #{ex['file_path']}:#{ex['line_number']}"
        msg = ex.dig('exception', 'message').to_s
        if verbose
          puts "     #{msg}"
          bt = ex.dig('exception', 'backtrace') || []
          bt.first(10).each { |l| puts "       #{l}" }
        else
          first_line = msg.lines.map(&:strip).reject(&:empty?).first.to_s
          puts "     #{first_line}"
        end
      end
    end

  else
    warn 'quiet-rspec: RSpec produced no JSON output (crash or load error)'
    warn '--- captured output (last 50 lines) ---'
    warn noise_lines.last(50).join
  end

  exit exit_status || 1

rescue JSON::ParserError => e
  warn "quiet-rspec: JSON parse error — #{e.message}"
  warn '--- captured output (last 50 lines) ---'
  warn noise_lines.last(50).join
  exit exit_status || 1

ensure
  File.delete(json_file)  if File.exist?(json_file)
  File.delete(noise_file) if File.exist?(noise_file)
end
