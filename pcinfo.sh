
get_user(){
    echo -e "$USER"
}

get_ip(){
    format "$(ip route get 1 | tr -s ' ' | cut -d' ' -f7)" lightblue    
}

get_directory(){
    format $(dirs) green
}

get_fqdn(){
    format " $(hostname -f)" bold
}

get_ssh(){
    format "$(if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\)$ ]] ; then echo '(SSH)'; fi)" lightblue
#    echo -e "$lightblue$(if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\)$ ]] ; then echo '(SSH)'; fi)$nocolor "
}
