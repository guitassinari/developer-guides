# Linux Namespaces

- Isolate resources
  - Each namespace is responsible for a set of resources:
    - mnt: filesystem
      - Example: a docker container will have a process inside the mnt namespace so that it can map actual filesystems (folders, archives...) to the container's filesystem.
    - pid: processes
      - Example: a docker container will have a process ID on the host system and another one inside it's own pid namespace. It won't have access to the host's processes unless the host's processes are also inside the container's pid namespace.
    - net: network
      - Example: ??
    - ipc: interprocess communication
      - Example: ??
    - user: user and group IDs
      - Example: ??
    - uts: hostname and domain name
      - Example: ??

> lists processess and their namespaces
>
> `> sudo lsns`

> move the current process to a new namespace
>
> `> sudo unshare --mount --pid --uts --ipc --net --user`

> run a command inside a given namespace of a process
>
> `> sudo nsenter -t <pid> -m -u -i -n -U <command>`

TODO: Add image

## Resources

- https://www.youtube.com/watch?v=BwI89OnYm-4 (and following videos in the playlist)