# ~/.profile: executed by the command interpreter for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#Loads the correct bashrc for the relevant system:
# if running bash

#Save to appropriate bash history file on shell exit - must be run before bash
#commands here
export HISTFILE=/home/$USER/.bash_histories/.bash_history_$(hostname)

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc_$(hostname)" ];
    then
      . "$HOME/.bashrc_$(hostname)"
    else
        echo "There is no .bashrc specific to this host, using default for host."
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Run python config on startup
export PYTHONSTARTUP=~/.pyrc:wq
