function portwho
    if test (count $argv) -ne 1
        echo "usage: portwho <port>"
        return 1
    end

    set -l port $argv[1]
    set -l pids (lsof -tiTCP:$port -sTCP:LISTEN)

    if test (count $pids) -eq 0
        echo "nothing listening on port $port"
        return 1
    end

    echo "lsof:"
    lsof -nP -iTCP:$port -sTCP:LISTEN

    echo
end
