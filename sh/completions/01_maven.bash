#!/bin/bash 
# https://github.com/Stubbs/maven-bash-completion

_mvn(){
    local cmds="archetype:create archetype:generate archetype:create-from-project \
        archetype:crawl clean validate compile test package integration-test \
		verify install deploy test-compile site generate-sources \
		process-sources generate-resources process-resources \
		eclipse:eclipse eclipse:add-maven-repo eclipse:clean \
		idea:idea -DartifactId= -DgroupId= -Dmaven.test.skip=true \
		-Declipse.workspace= -DarchetypeArtifactId= -DarchetypeGroupId= -DarchetypeVersion \
        -Dversion= -Dpackage= \
		netbeans-freeform:generate-netbeans-project \
		tomcat:run tomcat:run-war tomcat:deploy dependency:resolve dependency:get"
    local cur=${COMP_WORDS[$COMP_CWORD]}

    if [ $COMP_CWORD -gt 1 ]; then
	local pre_word=${COMP_WORDS[$(expr $COMP_CWORD - 1 )]}
	if [ "$cur" == : ]; then
	    COMPREPLY=( $(compgen -W "$cmds" ${pre_word}:) )
	    local i=${#COMPREPLY[*]}
	    while [ $((--i)) -ge 0 ]; do
		COMPREPLY[$i]=${COMPREPLY[$i]#*$pre_word:} 
	    done
	    return 0
	elif [ $pre_word == : ]; then
	    local pp_word=${COMP_WORDS[$(expr $COMP_CWORD - 2)]}
	    COMPREPLY=( $(compgen -W "$cmds" ${pp_word}:${cur}) )
	    local i=${#COMPREPLY[*]}
	    while [ $((--i)) -ge 0 ]; do
		COMPREPLY[$i]=${COMPREPLY[$i]#*$pp_word:} 
	    done
	    return 0
	fi
    fi
    
    COMPREPLY=( $(compgen -W "$cmds" $cur) )
}

complete -F _mvn mvn

