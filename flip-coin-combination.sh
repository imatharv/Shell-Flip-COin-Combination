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

echo "The win percentage of each combination in the singlet coin toss: "

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

echo "The win percentage of each combination in the doublet coin toss: "

for i in ${!result[@]}
do
   	percentWin=$( echo ${result[$i]} $iteration | awk '{print $1/$2 * 100}' )
   	echo "$i => $percentWin %"
done

#Use-case-4 Determining the percentage of the Triplet Combination
declare -A result

read -p "How many time do you want to toss" iteration

for ((count=0;count<$iteration;count++))
do
    	flip1=$((RANDOM%2))
    	flip2=$((RANDOM%2))
    	flip3=$((RANDOM%2))

    	if [[ $flip1 -eq 1 ]]
    	then
        		if [[ $flip2 -eq 1 ]]
        		then
            			if [[ $flip3 -eq 1 ]]
            			then
                			if [[ ${result["HHH"]} -eq null ]]
                			then
                    				result["HHH"]=1
                			else
                    				result["HHH"]=$((${result["HHH"]}+1))
                			fi
            			else
                			if [[ ${result["HHT"]} -eq null ]]
                			then
                    				result["HHT"]=1
                			else
                    				result["HHT"]=$((${result["HHT"]}+1))
                			fi
            			fi
        		else
            			if [[ $flip3 -eq 1 ]]
            			then
               	 		if [[ ${result["HTH"]} -eq null ]]
                			then
                    			result["HTH"]=1
                			else
                    			result["HTH"]=$((${result["HTH"]}+1))
                			fi
            			else
                			if [[ ${result["HTT"]} -eq null ]]
                			then
                    			result["HTT"]=1
                			else
                    			result["HTT"]=$((${result["HTT"]}+1))
                			fi
            			fi
        		fi
    	else
        		if [[ $flip2 -eq 1 ]]
        		then
            			if [[ $flip3 -eq 1 ]]
            			then
                				if [[ ${result["THH"]} -eq null ]]
                				then
                    				result["THH"]=1
                				else
                    				result["THH"]=$((${result["THH"]}+1))
                				fi
           	 		else
                				if [[ ${result["THT"]} -eq null ]]
                				then
                    				result["THT"]=1
               	 			else
                    				result["THT"]=$((${result["THT"]}+1))
                				fi
            			fi
        		else
            			if [[ $flip3 -eq 1 ]]
            			then
                				if [[ ${result["TTH"]} -eq null ]]
                				then
                    				result["TTH"]=1
                				else
                    				result["TTH"]=$((${result["TTH"]}+1))
                				fi
            			else
                				if [[ ${result["TTT"]} -eq null ]]
                				then
                    				result["TTT"]=1
                				else
                    				result["TTT"]=$((${result["TTT"]}+1))
                				fi
            			fi
        		fi
    	fi
done

echo "The win percentage of each combination in the triplet coin toss: "
for i in ${!result[@]}
do
	percentWin=$( echo ${result[$i]} $iteration | awk '{print $1/$2 * 100}' )
	echo "$i => $percentWin %"
done

#Use-case-5 Sort the Singlet, Doublet and Triplet combination and show the winning combination.
declare -A result1

read -p "How many time do you want to flip the coin: " iteration

echo "The Single Coin Toss "

for((count=0;count<$iteration;count++))
do
	flip=$((RANDOM%2))
	if [[ $flip -eq 1 ]]
	then
		if [[ ${result1["H"]} -eq null ]]
		then
			result1["H"]=1
		else
			result1["H"]=$((${result1["H"]}+1))
		fi

	else
	 	if [[ ${result1["T"]} -eq null ]]
      		then
         			result1["T"]=1
      		else
         			result1["T"]=$((${result1["T"]}+1))
      		fi
	fi
done

echo "The win percentage of each combination in the singlet coin toss: "

for i in ${!result1[@]}
do
   	percentWin=$( echo ${result1[$i]} $iteration | awk '{print $1/$2 * 100}' )
   	echo "$i => $percentWin %"
done

max1="H"

for i in ${!result1[@]}
do
   	if [[ ${result1[$i]} -gt ${result1[$max1]} ]]
	then
		max1=$i
	fi
done

echo The winner of the Singlet coin toss : $max1

declare -A result2

echo The Double Coin Toss

for ((count=0;count<$iteration;count++))
do
	flip1=$((RANDOM%2))
	flip2=$((RANDOM%2))

	if [[ $flip1 -eq 1 ]]
	then

		if [[ $flip2 -eq 1 ]]
		then
			if [[ ${result2["HH"]} -eq null ]]
			then
				result2["HH"]=1
			else
				result2["HH"]=$((${result2["HH"]}+1))
			fi
		else
			if [[ ${result2["HT"]} -eq null ]]
       			then
            				result2["HT"]=1
         			else
            				result2["HT"]=$((${result2["HT"]}+1))
         			fi
		fi
	else
		if [[ $flip2 -eq 1 ]]
      		then
         			if [[ ${result2["TH"]} -eq null ]]
         			then
            				result2["TH"]=1
         			else
            				result2["TH"]=$((${result2["TH"]}+1))
         			fi
      		else
         			if [[ ${result2["TT"]} -eq null ]]
         			then
            				result2["TT"]=1
         			else
            				result2["TT"]=$((${result2["TT"]}+1))
      			fi
		fi
	fi
done

echo "The win percentage of each combination in the doublet coin toss: "

for i in ${!result2[@]}
do
   	percentWin=$( echo ${result2[$i]} $iteration | awk '{print $1/$2 * 100}' )
   	echo "$i => $percentWin %"
done

max2="HH"

for i in ${!result2[@]}
do
   	if [[ ${result2[$i]} -gt ${result2[$max2]} ]]
   	then
      		max2=$i
  	fi
done

echo "The winner of the Doublet coin toss : $max2"

declare -A result3

echo "The Triple Coin Toss"

for ((count=0;count<$iteration;count++))
do
    	flip1=$((RANDOM%2))
    	flip2=$((RANDOM%2))
    	flip3=$((RANDOM%2))

    	if [[ $flip1 -eq 1 ]]
    	then
        		if [[ $flip2 -eq 1 ]]
        		then
            			if [[ $flip3 -eq 1 ]]
            			then
                			if [[ ${result3["HHH"]} -eq null ]]
                			then
                    				result3["HHH"]=1
                			else
                    				result3["HHH"]=$((${result3["HHH"]}+1))
                			fi
            			else
                			if [[ ${result3["HHT"]} -eq null ]]
                			then
                    				result3["HHT"]=1
                			else
                    				result3["HHT"]=$((${result3["HHT"]}+1))
                			fi
            			fi
        		else
            			if [[ $flip3 -eq 1 ]]
            			then
                			if [[ ${result3["HTH"]} -eq null ]]
                			then
                    				result3["HTH"]=1
                			else
                    				result3["HTH"]=$((${result3["HTH"]}+1))
                			fi
            			else
                			if [[ ${result3["HTT"]} -eq null ]]
                			then
                    				result3["HTT"]=1
                			else
                    				result3["HTT"]=$((${result3["HTT"]}+1))
                			fi
            			fi
        		fi
    	else
        		if [[ $flip2 -eq 1 ]]
        		then
            			if [[ $flip3 -eq 1 ]]
            			then
                			if [[ ${result3["THH"]} -eq null ]]
                			then
                    				result3["THH"]=1
                			else
                    				result3["THH"]=$((${result3["THH"]}+1))
                			fi
            			else
                			if [[ ${result3["THT"]} -eq null ]]
                			then
                    				result3["THT"]=1
                			else
                    				result3["THT"]=$((${result3["THT"]}+1))
                			fi
            			fi
       	 	else
            			if [[ $flip3 -eq 1 ]]
            			then
                			if [[ ${result3["TTH"]} -eq null ]]
                			then
                    				result3["TTH"]=1
                			else
                    				result3["TTH"]=$((${result3["TTH"]}+1))
                			fi
            			else
                			if [[ ${result3["TTT"]} -eq null ]]
                			then
                    				result3["TTT"]=1
                			else
                    				result3["TTT"]=$((${result3["TTT"]}+1))
                			fi
            			fi
        		fi
    	fi
done

echo "The win percentage of each combination in the triplet coin toss: "

for i in ${!result3[@]}
do
	percentWin=$( echo ${result3[$i]} $iteration | awk '{print $1/$2 * 100}' )
	echo "$i => $percentWin %"
done

max3="HHH"

for i in ${!result3[@]}
do
   	if [[ ${result3[$i]} -gt ${result3[$max3]} ]]
   	then
      		max3=$i
   	fi
done

echo "The winner of the Singlet toss : $max3"