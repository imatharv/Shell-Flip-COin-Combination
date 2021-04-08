#!/bin/bash

echo "welcome to flip coin combination"

#Use-case-1 Function for flipping a coin
function flipCoin(){
	result=$(( RANDOM%2 ))
	echo $result
}

#Use-case-2 Determining the percentage of the Singlet Combination
read -p "How many time do you want to flip the coin" iteration

headWinCounter=0
tailWinCounter=0

declare -A result

for((count=0;count<$iteration;count++))
do
	flip=$((RANDOM%2))
	if [[ $flip -eq 1 ]]
	then
		if [[ ${result["H"]} -eq null ]]
		then
			result["H"]=1
		else
			result["H"]=$((${result["H"]}+1))
	fi

	else
	 	if [[ ${result["T"]} -eq null ]]
      		then
         			result["T"]=1
      		else
        			result["T"]=$((${result["T"]}+1))
      		fi
	fi
done

echo The win percentage of each combination in the singlet coin toss:

for i in ${!result[@]}
do
   	percentWin=$( echo ${result[$i]} $iteration | awk '{print $1/$2 * 100}' )
   	echo "$i => $percentWin %"
done

#Use-case-3 Determining the percentage of the Doublet Combination
declare -A result

read -p "How many time do you want to toss: " iteration

for ((count=0;count<$iteration;count++))
do
	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))

	if [[ $flip1 -eq 1 ]]
	then
		if [[ $flip2 -eq 1 ]]
		then
			if [[ ${result["HH"]} -eq null ]]
			then
				result["HH"]=1
			else
				result["HH"]=$((${result["HH"]}+1))
			fi
		else
			if [[ ${result["HT"]} -eq null ]]
         			then
            				result["HT"]=1
         			else
            				result["HT"]=$((${result["HT"]}+1))
         			fi
		fi
	else
		if [[ $flip2 -eq 1 ]]
      		then
         			if [[ ${result["TH"]} -eq null ]]
         			then
            				result["TH"]=1
         			else
            				result["TH"]=$((${result["TH"]}+1))
         			fi
      		else
         			if [[ ${result["TT"]} -eq null ]]
         			then
            				result["TT"]=1
         			else
            				result["TT"]=$((${result["TT"]}+1))
      			fi
		fi
	fi
done

echo The win percentage of each combination in the doublet coin toss:

for i in ${!result[@]}
do
   	percentWin=$( echo ${result[$i]} $iteration | awk '{print $1/$2 * 100}' )
   	echo "$i => $percentWin %"
done