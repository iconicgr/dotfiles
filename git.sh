get_git(){
    if [[ -d '.git' ]]; then
        git_state="\n│    "

        if [[ -n "$(git status --porcelain)" ]]; then
            git_state+="$red"
        else
            git_state+="$green"
        fi

        local branch=$(git branch | grep '*' | awk '{print $2}')
        if [[ -z "$branch" ]]; then
            git_state+="(no commits yet)$nocolor"
        else
            git_state+="($branch)$nocolor"
        fi

        local number_stash="$(git stash list 2>/dev/null | wc -l)"
        if [[ ! "$number_stash" -eq 0 ]]; then
            git_state+=" $orange§$number_stash$nocolor"
        fi

        local number_staged="$(git diff --staged --name-only --diff-filter=AM 2> /dev/null | wc -l)"
        if [[ ! "$number_staged" -eq "0" ]]; then
            git_state+=" $green✔$number_staged$nocolor"
        fi

        local number_conflicts="$(git diff --name-only --diff-filter=U 2> /dev/null | wc -l)"
        if [[ ! "$number_conflicts" -eq "0" ]]; then
           git_state+= "$red✘$number_conflicts$nocolor"
        fi

        local number_modified="$(git diff --name-only --diff-filter=M 2> /dev/null | wc -l )"
        if [[ ! "$number_modified" -eq "0" ]]; then
            git_state+=" $red✚$number_modified$nocolor"
        fi

        local number_untracked="$(git ls-files --other --exclude-standard | wc -l)"
        if [[ ! "$number_untracked" -eq "0" ]]; then
            git_state+=" $red?$number_untracked$nocolor"
        fi

        local number_unpushed="$(git log --branches=*$branch --not --remotes | grep commit | wc -l)"
        if [[  ! "$number_unpushed" -eq "0" ]]; then
            git_state+=" $red⚑$number_unpushed$nocolor"
        fi

#       local number_ahead="$(git status -sb | grep ahead | sed 's/.*behind \(.*\)]/\1/')"
#        local number_behind="$(git status -sb | grep behind | sed 's/.*behind \(.*\)]/\1/')"
#        if [ ! "0$number_ahead" -eq 0 -o ! "0$number_behind" -eq 0 ]; then
#            if [ ! "$number_ahead" -eq 0 ]; then
#                git_state+=" $blue↑$number_ahead$nocolor"
#            fi
#            if [ ! "$number_behind" -eq 0 ]; then
#                git_state+=" $blue↓$number_behind$nocolor"
#            fi
#        fi

        echo -e "$git_state"
    fi
}
