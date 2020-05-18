# ~/.bash_profile: executed by the bash login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#Loads the correct bashrc for the system upon start
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrcs_$(hostname)" ];
    then
      . "$HOME/.bashrc_$(hostname)"
    else
        echo "There is no .bashrc specific to this host, using default for host."
    fi
fi

# Load the shell dotfiles, and then some:
for file in $HOME/.bash_{prompts/.bash_prompt,aliases/.bash_aliases,functions/bash_functions}_$(hostname); do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
