#!/bin/bash

_man2pdf() {
    local cur=${COMP_WORDS[$COMP_CWORD]}
    local path_all=$( echo $PATH | sed 's/:/ /g' )
    local command_all=
    local path=
    for path in ${path_all[*]}; do
    	command_all=${command_all[*]}\ $( ls $path )
    done
    COMPREPLY=( $(compgen -W "$command_all" $cur))

}

complete -F _man2pdf man2pdf
