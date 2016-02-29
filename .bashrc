# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color'
alias ll='ls -ltr --color'
alias review="/usr/ali/bin/post-review"
alias valgrind="/usr/bin/valgrind"
alias vgmem="/usr/bin/valgrind --tool=memcheck "
alias e='emacs'
alias r='/apsara/deploy/rpc_wrapper/rpc.sh'

export PS1='\n\e[1;37m[\e[m\e[1;32m\u\e[m\e[1;33m@\e[m\e[1;35m\h\e[m \e[4m`pwd`\e[m\e[1;37m]\e[m\e[1;36m\e[m\n\$'
export EDITOR=vim
alias vi='vim'

