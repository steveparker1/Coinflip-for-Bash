#!/usr/bin/bash
#CoinFlip 1.0
#Lucino Kumaru 8/21/2018
scorefile="CFscorefile_bash"
printf "Choose (h)eads or (t)ails: "
read user_choice
# Make sure user chooses between heads or tails
if [ $user_choice != h ] && [ $user_choice != t ]; then
echo "Invalid choice. Defaulting to (h)eads."
user_choice=h
fi
#Value of 1 is heads, 2 is tails
computer_choice=$((RANDOM % 2 + 1))
if [ $computer_choice -eq 1 ]; then
echo "Computer chose heads."
else
echo "Computer chose tails."
fi
if [ $computer_choice -eq 1 ] && [ $user_choice = h ]; then
# Correct
echo "You win!"
elif [ $computer_choice -eq 1 ] && [ $user_choice = t ]; then
# Incorrect
echo "You lose!"
exit
elif [ $computer_choice -eq 2 ] && [ $user_choice = t ]; then
# Correct
echo "You win!"
else
# Incorrect
echo "You lose!"
exit
fi
# Save High Score
read -p "Please enter your name: " name
echo $name $user_choice >> $scorefile
# print High Score
echo -e "\nPrevious high scores,"
cat $scorefile
