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

fish_add_path $GOPATH/bin

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

# tmp
alias main='javac Main.java && java Main'
alias vw='cd ~/documents/notes && vim index.wiki'
alias code="codium"
alias p="python3"

# scripts
alias setupmonitor='~/code/shell/setup_monitor.sh'
alias unsetupmonitor='~/code/shell/unsetup_monitor.sh'
alias rleft='~/code/shell/rotate_left_monitor.sh'
alias rnormal='~/code/shell/rotate_normal_monitor.sh'

# ls aliases
alias ll='exa -alF'
alias la='exa -A'
alias l='exa -CF'
alias lsj='exa | grep .java'

# my aliases
alias v='nvim'
alias vf='nvim (fzf)'
alias vim='nvim'
alias td='nvim ~/documents/todo.md'
alias photos='sxiv -tf ~/media/photos/100andro/'
alias wp='sxiv -tf ~/media/wallpapers/'
alias jodoro='java -cp ~/Projects/jodoro/target/classes outer.space.jodoro.GUI&'
# alias o='xdg-open (fzf)'

# config files
alias vconf='cd ~/.config/nvim/ && nvim ~/.config/nvim/init.lua'
alias i3conf='nvim ~/.config/i3/config'
alias pconf='nvim ~/.config/polybar/config'
alias lfconf='nvim ~/.config/lf/lfrc'
alias fconf='nvim ~/.config/fish/config.fish'

alias rmc='rm *.class'
alias rmo='rm -rf *.out*'
alias rmt='rm -rvi ./tmp'
alias r='ranger'
alias z='fzf --bind "enter:execute(swallow zathura {}&)"'
alias zb='cd ~/books && fzf --bind "enter:execute(swallow zathura {}&)"'
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
alias gl="git log --graph --all --oneline"
alias gd="git diff"
alias gp="git push origin head"
alias gfp="git push -f origin head"

