#!/usr/bin/env -S zsh --login

#
# An emacs wrapper to ensure that the zshenv is sourced when the
# terminal is opened.
#

[[ -f /root/.zshenv ]] && . /root/.zshenv
[[ -f /root/.zshrc ]] && . /root/.zshrc

/usr/bin/emacs
