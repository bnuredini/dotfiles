function opend
    set date (date +%Y-%m-%d)
    set file ~/documents/$date.md

    if not test -f $file
        printf "## %s\n\n\n" $date > $file
        nvim "+call cursor(3, 1) | startinsert" $file
    else
        nvim $file
    end
end
