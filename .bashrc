#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export QSYS_ROOTDIR="/home/phil/.cache/yay/intel_fpga_lite/src/install/quartus/sopc_builder/bin"
alias config='/usr/bin/git --git-dir=/home/phil/myconfig/ --work-tree=/home/phil'
