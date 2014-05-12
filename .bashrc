# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

alias vi='vim.gnome'
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -al'
alias sz='ssh togic@sztogic'
alias togic='ssh -i ~/.ssh/togic.entry -p 8989 togic@117.121.25.163'


export PATH=$PATH:/home/mts/bin

export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45
export JRE_HOME=/usr/lib/jvm/jdk1.6.0_45/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

export SDK_ROOT=/home/mts/work1/android-sdk-linux
export ANDROID_SDK_ROOT=$SDK_ROOT
export ANDROID_SDK_HOME=$SDK_ROOT
export NDK_ROOT=/home/mts/work1/android-ndk-r9
export PATH=$PATH:$SDK_ROOT/tools:$SDK_ROOT/build-tools:$SDK_ROOT/platform-tools:$NDK_ROOT:$NDK_ROOT/toolchains

export COCOS2DX=/home/mts/work2/cocos2d-x-v3.0
export COCOS2DX_ROOT=$COCOS2DX

export PATH=$PATH:/home/mts/work1/CodeSourcery/Sourcery_G++_Lite/bin/
export PATH=$PATH:/home/mts/work1/CodeSourcery/Sourcery_G++_Lite/arm-none-eabi/bin/
export PATH=$PATH:/home/mts/work1/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi/bin/
export PATH=$PATH:/home/mts/work1/gnutools/arc2.3-p0/elf32-4.2.1/bin/
export PATH=$PATH:/home/mts/work1/gnutools/arc2.3-p0/uclibc-4.2.1/bin/
export PATH=$PATH:/home/mts/work1/gradle-1.6/bin/


export NODE_JS=/home/mts/work1/node-v0.10.26-linux-x64
export MONGO_DB=/home/mts/work1/mongodb-linux-x86_64-2.4.9
export PATH=$PATH:$NODE_JS/bin:$MONGO_DB/bin
