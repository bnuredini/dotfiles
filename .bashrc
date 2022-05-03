[ -n "$PS1" ] && source ~/.bash_profile;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PS1="\[\033[38;5;208m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;70m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;67m\]\w\[$(tput sgr0)\]: \[$(tput sgr0)\]"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:/opt/mssql-tools/bin:/home/bleart/code/shell"

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 100% --layout=reverse --exact'

weather() { ansiweather -l Ferizaj -a false; }

o() { xdg-open "$(fzf)"; }
