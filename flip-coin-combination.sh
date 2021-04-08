#!/bin/bash

echo "welcome to flip coin combination"

#Use-case-1 Function for flipping a coin
function flipCoin(){
	result=$(( RANDOM%2 ))
	echo $result
}