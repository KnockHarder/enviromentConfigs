#!/bin/bash
alias vi=vim
alias dirs='dirs -p'
alias upper_uuid='cat /proc/sys/kernel/random/uuid | sed s/-//g | tr "a-z" "A-Z"'
alias date_ymd='date +%Y-%m-%d'
alias sed_camel_case='sed -r "s/([A-Z]+)/\L\1\E/g;s/(^|\s)([a-z]+)_/ /g;s/_(\w)/\U\1\E/g"'
alias tr_upper='tr [a-z] [A-Z]'
alias cd_git_root='cd $(git rev-parse --show-toplevel)'
