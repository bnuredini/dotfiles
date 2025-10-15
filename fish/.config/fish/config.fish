if status is-interactive

  # fish_vi_key_bindings
  set fish_cursor_default     block
  set fish_cursor_visual      block
  set fish_cursor_insert      line
  set fish_cursor_replace_one underscoreblink
end

set fish_vi_force_cursor 1
set fish_greeting

set EDITOR nvim
set -Ux GOPATH $HOME/.local/go

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fish_add_path $GOPATH/bin
fish_add_path $HOME/code/scripts
fish_add_path $HOME/bin

zoxide init fish | source

function opend 
    nvim ~/documents/(date +'%Y-%m-%d').md
end

# working with directories
alias d="cd ~/downloads"
alias b="cd ~/books"
alias j="cd ~/code/java/random"
alias play="cd ~/code/playground"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../..."

# scripts
alias monitor-setup='~/code/scripts/setup_monitor.sh'
alias monitor-unsetup='~/code/scripts/unsetup_monitor.sh'
alias monitor-rotate-left='~/code/scripts/rotate_left_monitor.sh'
alias monitor-rotate-right='~/code/scripts/rotate_normal_monitor.sh'

# other programs
alias v='nvim'
alias vf='nvim (fzf)'
alias p="python3"
alias ll='exa -alF'
alias la='exa -A'
alias l='exa -CF'
alias lsj='exa | grep .java'

# documents
alias td='cd ~/documents && nvim ~/documents/todo.md'
alias vw='cd ~/documents/notes && vim index.wiki'
alias opend="nvim ~/documents/(date +'%Y-%m-%d').md"

# config files
alias vconf='cd ~/.config/nvim/ && nvim ~/.config/nvim/init.lua'
alias i3conf='nvim ~/.config/i3/config'
alias pconf='nvim ~/.config/polybar/config'
alias lfconf='nvim ~/.config/lf/lfrc'
alias fconf='nvim ~/.config/fish/config.fish'

# volume aliases
alias am='amixer set Master 100'	# set max
alias ah='amixer set Master 50'		# set medium
alias a0='amixer set Master 0'		# set zero
alias vm='pactl set-sink-volume @DEFAULT_SINK@ 150%'

# tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# git
alias gs="git status"
alias gl="git log --graph --all --oneline"
alias gd="git diff"
alias gp="git push origin head"
alias gfp="git push -f origin head"
