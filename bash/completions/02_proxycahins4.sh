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
	*)
	    rel_cmd=${COMP_WORDS[1]}
	    case $rel_cmd in
		"git")
		    COMPREPLY=( $(compgen -W "fetch pull push" $cur))
		    ;;
		"ssh")
		    COMPREPLY=( $(compgen -W "wangzhiqiang@172.16.192.199" $cur))
		    ;;
		"mvn")
		    (( COMP_CWORD --))
		    COMP_WORDS=( ${COMP_WORDS[@]:1} )
		    _mvn
		    return 0
		    ;;
		*)
		    COMPREPLY=()
		    return 0
		    ;;
	    esac
	    ;;
    esac
}

complete -F _proxychains proxychains4
