# SSH CLI

The SSH CLI allows to establish secure, encrypted connections between two hosts allowing for:
- Terminal access
- File transfer
- Tunelling (what is this?)
- Others


## Config file

The SSH config file allows you to name common hosts you connect to and settings to use when connecting to them.
The file below, for example, allows for easy connection to GitHub by mapping `github.com-user1` to one github account
and `github.com-user2` to another.

You could use `ssh github.com-user1` or `ssh github.com-user2` to connect to github through ssh.

```
Host github.com-user1
  HostName github.com
  User git
  IdentityFile ~/.ssh/key1
  IdentitiesOnly yes
   
Host github.com-user2
  HostName github.com
  User git
  IdentityFile ~/.ssh/key2
  IdentitiesOnly yes
```