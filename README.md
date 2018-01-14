# Let Me In!

So I need SSH access to your server to help with something? No sweat, this gets us up and going quickly and easily.

```sh
$ bash <(curl -sSL https://github.com/kennethkalmer/letmein/raw/master/letmein.sh) PASSKEY_NAME
```

**This script will try and use `sudo` if needed, so enter your password when prompted.**

So, this goes both ways. Firstly you should use the _PASSKEY_NAME_ I've given you, or it won't work at all. Secondly, you understand this gives me **sudo** on your box.


## Additional notes

This has only been tested on Ubuntu 16.04 LTS so far.


## Closing the door

Very important! If (and most certainly when) you need to revoke my access, you can simply run the following command:

```sh
$ sudo userdel -rf kenneth
```

## Advanced usage

Please download `letmein.sh` and see what can be tweaked, then run it locally.
