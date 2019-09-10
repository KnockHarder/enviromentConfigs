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
	    COMPREPLY=( $(compgen -W "$command_all" $cur))
	    ;;
	2)
	    pre_word=${COMP_WORDS[1]}
	    case $pre_word in
		"git")
		    COMPREPLY=( $(compgen -W "fetch pull push" $cur))
		    ;;
		"ssh")
		    COMPREPLY=( $(compgen -W "wangzhiqiang@172.16.192.199" $cur))
		    ;;
		"mvn")
		    _mvn
		    ;;
		*)
		    COMPREPLY=()
		    return 0
		    ;;
	    esac
	    ;;
	*)
	    COMPREPLY=()
	    return 0
	    ;;
	
    esac
}

complete -F _proxychains proxychains4
