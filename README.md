Just type `atis PATH_TO_FILE` to print stuff remotely on a ATIS printer of the KIT using SSH.

## Steps to use the function:
1. Generate a SSH key on the device you want to print stuff from (e.g. `ssh-keygen -t ed25519 -o -a 100`).
2. Edit your `.ssh/config` for convenience:
``` bash
Host atis
  HostName i08fs1.informatik.kit.edu
  User YOUR_ATIS_USERNAME
```
3. Connect to your ATIS account via SSH (`ssh atis`) and add your generated SSH publickey to `.ssh/authorized_keys`. Alternatively just do `cat ~/.ssh/id_ed25519.pub | ssh atis 'cat >> .ssh/authorized_keys'`. You need to enter your ATIS password.
4. Connect to your ATIS account again (`ssh atis`) and make sure that you don't need to enter your password again.
5. Type `source PATH_TO_THIS_REPO/atis.sh` to activate the function.
6. You should now be able to print files by typing `atis PATH_TO_FILE`.
7. On your host, add `source PATH_TO_THIS_REPO/atis.sh` to your `~/.bashrc` or `~/.zshrc` to keep the function activated in future shell sessions.


## Specifying a printer
You can additionally specify a specific printer by typing `atis PATH_TO_FILE PRINTER_NAME`.

In theory, valid values for `PRINTER_NAME` are: 
- `pool-sw1` (or `sw1`)
- `pool-sw2` (or `sw2`)
- `pool-sw3` (or `sw3`) 
- `pool-farb1` (or `farb1`) 

However, I found that only `pool-sw3` and `pool-farb1` work reliably. Hence, I set `pool-sw3` as the default printer.


## Specifying a printing mode
You can additionally specify a print mode by typing `atis PATH_TO_FILE PRINTER_NAME PRINT_MODE`.

Valid values for `PRINT_MODE` are:
- `one-sided` (or `simplex`) 
- `two-sided-long-edge` (or `duplex`)
- `two-sided-short-edge`

The default print mode is `two-sided-long-edge` (or `duplex`).


Thanks to the ATIS people for [this docu](https://www.atis.informatik.kit.edu/1323.php).
