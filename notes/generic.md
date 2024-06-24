* Set up UTC time.
sudo timedatectl set-timezone UTC

* gcc, g++, cmake, make, git, vim.

* lm-sensors (to see CPU temperature etc. from command line).

* Ensure wayland used.

```
$ loginctl
$ loginctl show-session <SESSION_ID> -p Type
```

* [base16-shell](https://github.com/chriskempson/base16-shell)

* Ruby
  * [ruby-install](https://github.com/postmodern/ruby-install)
  * [chruby](https://github.com/postmodern/chruby)
  * Important gems
    * awesome_print
    * oj
    * ox
    * xsel
    * bundler
