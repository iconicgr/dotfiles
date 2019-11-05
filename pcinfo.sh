
get_user(){
    echo -e "$USER"
}

ip="$(ip route get 1 | tr -s ' ' | cut -d' ' -f7)"

get_ip(){
    format $ip lightblue    
    #echo -e "$lightblue$ip$nocolor"
}

get_directory(){
    echo -e "$green$(dirs)$nocolor"
}

fqdn="$(hostname -f)"

get_fqdn(){
    echo -e " $bold$fqdn$nocolor"
}

get_ssh(){
    echo -e "$lightblue$(if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\)$ ]] ; then echo '(SSH)'; fi)$nocolor "
}

