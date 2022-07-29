SHELL := /bin/bash
install-homebrew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	eval "$(shell /opt/homebrew/bin/brew shellenv)"

install-zsh:
	brew install zsh
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

install-powerlevel:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $$HOME/.oh-my-zsh/custom/themes/powerlevel10k
	sed -E -iE 's/ZSH_THEME=\".+\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g' ~/.zshrc
