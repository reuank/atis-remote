This function allows you to print stuff remotely on the ATIS printer of the KIT using your account.

## Steps to use the function:
1. Generate a SSH key on the device you want to print stuff from (e.g. `ssh-keygen -t ed25519 -o -a 100`)
2. Edit your `.ssh/config` for convenience:
``` bash
Host atis
  HostName i08fs1.informatik.kit.edu
  User YOUR_ATIS_USERNAME
```
3. Connect to your ATIS account via SSH (`ssh atis`) and add your generated SSH publickey to `.ssh/authorized_keys`. Alternatively just do `cat ~/.ssh/id_ed25519.pub | ssh atis 'cat >> .ssh/authorized_keys'`. You need to enter your ATIS password.
4. Connect to your ATIS account again (`ssh atis`) and make sure that you don't need to enter your password again
5. Add `source PATH_TO_THIS_REPO/.atis` to your `~/.bashrc` or `~/.zshrc` to activate the function
6. You should now be able to print files by typing `atis PATH_TO_FILE`
