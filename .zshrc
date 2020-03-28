# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

bindkey -v

function zle-line-iit zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
  zle reset-prompt
}

# Path to your oh-my-zsh installation.
  export ZSH="/home/phil/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  archlinux
  screen
  python
  sudo
  urltools
  encode64
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# quartus modelsim
export PATH=/opt/intel_fpga_lite/18.0/quartus/bin/:$PATH
export PATH=/opt/intel_fpga_lite/18.0/quartus/sopc_builder/bin/:$PATH
export PATH=/opt/intel_fpga_lite/18.0/nios2eds/:$PATH
export PATH=/opt/intel_fpga_lite/19.1/modelsim_ase/linuxaloem:$PATH
export PATH=/home/phil/bin/:$PATH
 export MTI_HOME=/opt/intel_fpga_lite/19.1/modelsim_ase


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
 alias v="nvim"
 alias nv="nvim"
 alias vim="nvim"
 alias zshconfig="v ~/.zshrc"
 alias ohmyzsh="v ~/.oh-my-zsh"
 alias i3config="v ~/.config/i3/config"
 alias i3sconfig="v ~/.config/i3status/config"
 alias vimconfig="v ~/.vimrc"
 alias nvimconfig="v ~/.config/nvim/init.vim"

 alias nko="cd /home/phil/Dokumente/hdl-prj-nanokopter"


 #alias vsim='/opt/intel_fpga_lite/16.0/modelsim_ase/linuxaloem/vsim'
 #alias vcom='/opt/intel_fpga_lite/16.0/modelsim_ase/linuxaloem/vcom'

 source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


 #export http_proxy="http://192.168.1.123:3128"
 #export https_proxy="http://192.168.1.123:3128"
 #export ftp_proxy="http://192.168.1.123:3128"
 #
 TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}
alias config='/usr/bin/git --git-dir=/home/phil/.cfg/ --work-tree=/home/phil'
