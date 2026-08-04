#
# Exports.
#

set --universal --export GOPATH $HOME/.local/go
set --universal --export BUN_INSTALL "$HOME/.bun"

fish_add_path $GOPATH/bin
fish_add_path $HOME/code/scripts
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/go/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path /home/bleart/.nvm/versions/node/v18.20.3/bin

zoxide init fish | source

#
# Vim stuff.
#

fish_vi_key_bindings

if status is-interactive
  set fish_cursor_default     block
  set fish_cursor_visual      block
  set fish_cursor_insert      line
  set fish_cursor_replace_one underscoreblink
end

set fish_vi_force_cursor 1
set fish_greeting

set -Ux EDITOR nvim
set -Ux GOPATH $HOME/.local/go


#
# Aliases.
#

alias dls="docker container ls --format 'table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}'"
alias ccd="psurf"
alias qot="~/code/qot/build/game.x86_64"
alias z="zed -r"

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
alias ll='eza -alF'
alias la='eza -A'
alias l='eza -CF'
alias lsj='eza | grep .java'

# documents
alias td='cd ~/documents && nvim ~/documents/todo.md'
alias work="cd ~/documents && nvim work.md"
alias vw='cd ~/documents/notes && vim index.wiki'
alias opend="nvim ~/documents/(date +'%Y-%m-%d').md"

# config files
alias vconf='cd ~/.config/nvim/ && nvim ~/.config/nvim/init.lua'
alias i3conf='nvim ~/.config/i3/config'
alias wconf='nvim ~/.config/wezterm/wezterm.lua'
alias pconf='nvim ~/.config/polybar/config'
alias lfconf='nvim ~/.config/lf/lfrc'
alias fconf='nvim ~/.config/fish/config.fish'

alias rmc='rm *.class'
alias rmo='rm -rf *.out*'
alias rmt='rm -rvi ./tmp'
alias r='ranger'
alias date2name='~/downloads/bin/date2name/date2name/date2name.py'

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
alias gb="git branch"
alias gl="git log --graph --all --oneline"
alias gd="git diff"
alias gp="git push origin (git branch --show-current)"
alias gfp="git push --force origin (git branch --show-current)"

set -gx TERM xterm-256color

# For managing Node versions
fnm env --use-on-cd | source

# Pi
fish_add_path "/Users/bleartnuredini/.local/share/fnm/node-versions/v22.22.2/installation/bin"
