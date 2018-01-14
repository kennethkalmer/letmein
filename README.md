# Let Me In!

So I need SSH access to your server to help with something? No sweat, this gets us up and going quickly and easily.

```sh
$ bash <(curl -sSL https://github.com/kennethkalmer/letmein/raw/master/letmein.sh) PASSKEY_NAME
``

**This script will try and use `sudo` if needed, so enter your password when prompted.**

So, this goes both ways. Firstly you should use the _PASSKEY_NAME_ I've given you, or it won't work at all. Secondly, you understand this gives me **sudo** on your box.

