#!/bin/bash
_match_words(){
    local command_all=($1)
    local word=$2
    
    local end=${#word}
    if [ $end -eq 0 ]; then
	COMPREPLY=( ${command_all[*]} )
	return
    fi
    for com in ${command_all[*]}; do
	if [[ "$com" == "$word"* ]]; then
	    COMPREPLY=( ${COMPREPLY[*]} $com )
	fi
    done
    if [ ${COMPREPLY[0]} == "" ]; then
	COMPREPLY=
    fi
}

_comp_proxy() {
    local word=${COMP_WORDS[$COMP_CWORD]}
    local prefix=${COMP_WORDS[$COMP_CWORD-1]}
    local path_all=$( echo $PATH | sed 's/:/ /g' )
    local path=
    local command_all=
    for path in ${path_all[*]}; do
    	command_all=( ${command_all[*]} $( ls $path ) )
    done
    case $COMP_CWORD in
    	1)
	    _match_words "${command_all[*]}" $word
	    ;;
	2)
	    if [ $prefix == git ]; then
    		command_all=( fetch pull push )
	    else
		if [ $prefix == ssh ]; then
		    command_all=( wangzhiqiang@172.16.192.199 )
		fi
	    fi
	    _match_words "${command_all[*]}" $word
	    ;;
	*)
	    COMPREPLY=
	    ;;
    esac
}

complete -F _comp_proxy proxychains4
