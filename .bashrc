
nocolor='\e[0m'
red='\e[91m'
green='\e[92m'
orange='\e[38;5;215m'
blue='\e[44m'
cyan='\e[46m'
lightblue='\e[96m'
bold='\e[1m'
grey='\e[38;5;239m'

user=$USER

get_user(){
    echo -e "$user"
}

ip="$(ip route get 1 | tr -s ' ' | cut -d' ' -f7)"

get_ip(){
    echo -e "$lightblue$ip$nocolor"
}

get_directory(){
    echo -e "$green$(dirs)$nocolor"
}

fqdn="$(hostname -A | rev | cut -c 2- | rev | cut -f1 -d' ')"
#$(nslookup $ip | cut -f 2 | cut -f 2 -d "=" | rev | cut -c 2- | rev | awk '{$1=$1};1');

get_fqdn(){
    echo -e " $bold$fqdn$nocolor"
}

get_ssh(){
    echo -e "$lightblue$(if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\)$ ]] ; then echo SSH; fi)$nocolor "
}

get_git(){
    if [ -d '.git' ]; then
        git_state="\n│   $bold$nocolor "

        if [ -n "$(git status --porcelain)" ]; then
            git_state+="$red"
        else
            git_state+="$green"
        fi

        local branch=$(git branch | grep '*' | awk '{print $2}')
        if [ -z "$branch" ]; then
            git_state+="(no commits yet)$nocolor"
        else
            git_state+="($branch)$nocolor"
        fi

        local number_stash="$(git stash list 2>/dev/null | wc -l)"
        if [ ! "$number_stash" -eq 0 ]; then
            git_state+=" $orange§$number_stash$nocolor"
        fi

        local number_staged="$(git diff --staged --name-only --diff-filter=AM 2> /dev/null | wc -l)"
        if [ ! "$number_staged" -eq "0" ]; then
            git_state+=" $green✔$number_staged$nocolor"
        fi

        local number_conflicts="$(git diff --name-only --diff-filter=U 2> /dev/null | wc -l)"
        if [ ! "$number_conflicts" -eq "0" ]; then
           git_state+= "$red✘$number_conflicts$nocolor"
        fi

        local number_modified="$(git diff --name-only --diff-filter=M 2> /dev/null | wc -l )"
        if [ ! "$number_modified" -eq "0" ]; then
            git_state+=" $red✚$number_modified$nocolor"
        fi

        local number_untracked="$(git ls-files --other --exclude-standard | wc -l)"
        if [ ! "$number_untracked" -eq "0" ]; then
            git_state+=" $red↔$number_untracked$nocolor"
        fi

        local number_unpushed="$(git log --branches --not --remotes | grep commit | wc -l)"
        if [  ! "$number_unpushed" -eq "0" ]; then
            git_state+=" $red⚑$number_unpushed$nocolor"
        fi


        echo -e "$git_state"
    fi
}

PS1='\n┌──'
#PS1+='$(get_user) '
PS1+='$(get_fqdn) '
#PS1+='($(get_ip)) '
PS1+='($(get_directory)) '
PS1+='$(get_git)'
PS1+='\n└──╼ $(get_ssh)\$ '


## Loading aliases
## Tom Lawrence script
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
