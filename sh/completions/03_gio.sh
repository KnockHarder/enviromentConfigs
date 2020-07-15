#!/bin/bash 

_gio(){
    local cmds="help version cat copy info list mime mkdir monitor mount move open rename remove save set trash tree"
    local cur=${COMP_WORDS[$COMP_CWORD]}
    case ${COMP_CWORD} in
	1)
	    COMPREPLY=( $(compgen -W "$cmds" $cur) )
	    ;;
	2)
	    compopt -o nospace
	    COMPREPLY=( $(compgen -f $cur) )
	    ;;
    esac
}

complete -F _gio gio

