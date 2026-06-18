#!/bin/bash

number_of_data=$(wc -l < ./temp.txt)

getting_cpu_temp() 
{
	raw_temp=$(cat /sys/class/thermal/thermal_zone0/temp) 
	temp=$((raw_temp / 1000))
	temp=$"$temp"°C
}

save_cpu_temp()
{
	echo $temp >> ./temp.txt 
}

if (( number_of_data < 120 ))#saving the current temperature into the ./temp.txt
then
    	getting_cpu_temp
		save_cpu_temp
elif ((number_of_data == 120))
then
	echo "" > ./temp.txt # making a reset of the data inside of ./temp.txt 
fi





