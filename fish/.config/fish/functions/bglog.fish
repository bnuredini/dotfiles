function bglog
    mkdir -p "$HOME/logs"
    set logfile "$HOME/logs/"(basename "$PWD")"-"(date +%F)".log"
    nohup env NO_COLOR=1 FORCE_COLOR=0 TERM=dumb $argv >> "$logfile" 2>&1 </dev/null &
    disown
    echo $logfile
end
