setopt histignorealldups sharehistory
setopt interactivecomments

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Report running time if command takes > 3 seconds
REPORTTIME=3

# Use modern completion system
autoload -U compinit colors vcs_info
compinit

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search
bindkey '^R' history-incremental-search-backward

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Vi mode
zle-keymap-select () {
 # _init
  zle reset-prompt
}
zle -N zle-keymap-select
zle-line-init () {
  zle -K viins
}
zle -N zle-line-init
bindkey -v

source $HOME/.aliases
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

autoload -U promptinit; promptinit

path+=/opt/homebrew/bin
path+=/opt/homebrew/opt/postgresql@13/bin
path+=/usr/local/go/bin
path+=$HOME/.local/go/bin
path+=/var/lib/flatpak/exports/bin
path+=~/code/scripts

export PATH
export GOPATH="$HOME/.local/go"
export EDITOR="nvim"
export SECURITY_JWT_SECRET=my-new-super-secret-key
export SECURITY_JWT_HMACKEYS=my-new-super-secret-key,my-super-secret-key
export HOMEBREW_PREFIX=/opt/homebrew

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"

newd() {
    touch ~/documents/$(date +'%Y-%m-%d').md 
    echo "# $(date +'%Y-%m-%d')\n\n" >> ~/documents/$(date +'%Y-%m-%d').md
    nvim ~/documents/$(date +'%Y-%m-%d').md
}

opend() {
    nvim ~/documents/$(date +'%Y-%m-%d').md
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ufetch

source /home/bleart/.config/broot/launcher/bash/br
