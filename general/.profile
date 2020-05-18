#Start-up login file loads the correct profiles for various shells.
#Currently not really doing what I want..

# Load the shell dotfiles, and then some:
#for file in $HOME/.bash_{prompts/.bash_prompt,aliases/.bash_aliases,functions/bash_functions}_$(hostname); do
#	[ -r "$file" ] && [ -f "$file" ] && source "$file";
#done;
#unset file;

echo "testing"

#Bash - indepsite
#if [ -r ~/.bash_profile ];
#  then . ~/.bash_profile;
#fi
#If have an interactive shell, source bashrc
#case "$-" in *i*)
#if [ -r ~/.bashrcs/.bashrc_$(hostname) ];
#  then . ~/.bashrcs/.bashrc_$(hostname) ;
#fi;
#esac
