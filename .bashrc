script_dir="${BASH_SOURCE%/*}"
source $script_dir/formatting.sh
source $script_dir/pcinfo.sh
source $script_dir/git.sh

nocolor='\x01\e[0m\x02'
red='\x01\e[91m\x02'
green='\x01\e[92m\x02'
orange='\x01\e[38;5;215m\x02'
blue='\x01\e[36m\x02'
cyan='\x01\e[46m\x02'
lightblue='\x01\e[96m\x02'
bold='\x01\e[1m\x02'
grey='\x01\e[38;5;239m\x02'

PS1='\[\033[00m\]'
PS1+='$(get_user)'
PS1+='$(get_fqdn)'
PS1+='$(get_ip)'
PS1+='$(get_directory)'
PS1+='$(get_git)'
PS1+='$(get_ssh)'
#PS1+='\n\$: '
if [[ "$EUID" -ne 0 ]]
then
PS1+='\n$: '
else
PS1+='\n\[\033[31m\]root: '
trap 'tput sgr0' DEBUG
fi

export TERM=xterm-256color
export COLORTERM=truecolor

PATH="$PATH:/usr/local/lib/nodejs/node/bin"

tmux
