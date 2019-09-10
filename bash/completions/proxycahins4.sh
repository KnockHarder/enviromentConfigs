#!/bin/bash

_proxychains() {
    local cur=${COMP_WORDS[$COMP_CWORD]}

    case $COMP_CWORD in
    	1)
	    local path_all=$( echo $PATH | sed 's/:/ /g' )
	    local command_all=
	    local path=
	    for path in ${path_all[*]}; do
    		command_all=${command_all[*]}\ $( ls $path )
	    done
	    ;;
	2)
	    pre_word=${COMP_WORDS[1]}
	    if [ $pre_word == "git" ]; then
    		command_all="fetch pull push"
	    else
		if [ $pre_word == "ssh" ]; then
		    command_all="wangzhiqiang@172.16.192.199"
		fi
	    fi
	    ;;
	*)
	    COMPREPLY=()
	    return 0
	    ;;
	
    esac
    COMPREPLY=( $(compgen -W "$command_all" $cur))
}

complete -F _proxychains proxychains4
