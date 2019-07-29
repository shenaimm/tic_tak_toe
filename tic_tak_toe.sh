a=''
b=''
c=''
d=''
e=''
f=''
g=''
h=''
i=''

possible_positions=[1,2,3,4,5,6,7,8,9]
possible_moves=['X','O']
game_state='active'
game_counter=1
declare -a places_used
draw () {
	echo ''
	echo ''
	echo "  $a  |  $b  |  $c "
	echo '--------------'
	echo "  $d  |  $e  |  $f "
	echo '--------------'
	echo "  $g  |  $h  |  $i "
	echo ''
	echo ''

}

ask_input () {
	if [ $game_counter -eq 1 ];
		then 
			read -p 'What would you like to take X or O? ' player_choice
			check_input_pat
	fi
	read -p 'Please Input the Position you want to play for - ' player_position
	check_input_position
	
	places_used+=($player_position)	
	((game_counter++))

}
array_contains () { 
    local array="$1[@]"
    local seeking=$2
    local in=0
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=1
            break
        fi
    done
    return $in
}
check_input_position () {
	while [ " ${possible_positions[*]} " != *"$player_position"* ] && [ $(array_contains places_used $player_position) ]
	    do  echo 'You entered a wrong position Idiot'
	    	read -p 'Please Input the Position you want to play for - ' player_position
	    done

}

check_input_pat () {
	while [[ " ${possible_moves[*]} " != *"$player_choice"* ]]
	    do  echo 'You entered a wrong Pattern Idiot'
	    	read -p 'Please Input the correct Pattern X or O? - ' player_choice
	    done

}

make_position () {
	if [ $player_position -eq 1 ]
	   then 
	   	a=$player_choice
	elif [ $player_position -eq 2 ]
	   then
	   	b=$player_choice
	elif [ $player_position -eq 3 ]
	   then
	   	c=$player_choice
	elif [ $player_position -eq 4 ]
	   then
	   	d=$player_choice
	elif [ $player_position -eq 5 ]
	   then
	   	e=$player_choice
	elif [ $player_position -eq 6 ]
	   then
	   	f=$player_choice
	elif [ $player_position -eq 7 ]
	   then
	   	g=$player_choice
	elif [ $player_position -eq 8 ]
	   then
	   	h=$player_choice
	else
		i=$player_choice
	fi

}

main () {
	draw
	ask_input
	make_position
	draw
}

while [ $game_state = 'active' ]
	do 
		main
	done