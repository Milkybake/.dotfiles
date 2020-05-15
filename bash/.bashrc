# Default: ~/.bashrc: executed by bash(1) for non-login shells - i.e. non-ssh
# sessions. 
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

#Save to appropriate bash history file on shell exit - must be run before bash
#commands here
export HISTFILE=/home/$USER/.bash_histories/.bash_history_$(hostname)

#Loads the correct bashrc for the relevant system:
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrcs/.bashrc_$(hostname)" ];
    then
      . "$HOME/.bashrcs/.bashrc_$(hostname)"
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
