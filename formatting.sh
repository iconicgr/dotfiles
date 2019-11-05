declare -A format=(
	[nocolor]='\x01\e[0m\x02' 
	[red]='\x01\e[91m\x02' 
	[green]='\x01\e[92m\x02' 
	[orange]='\x01\e[38;5;215m\x02' 
	[blue]='\x01\e[36m\x02' 
	[cyan]='\x01\e[46m\x02' 
	[lightblue]='\x01\e[96m\x02' 
	[bold]='\x01\e[1m\x02' 
	[grey]='\x01\e[38;5;239m\x02' 
)

format(){
    echo -e "${format[$2]}$1${format[nocolor]}"
}
