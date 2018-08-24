#!/usr/bin/bash
#CoinFlip 2.0
#Lucino Kumaru 8/21/2018 shinjox27@gmail.com
scorefile="CFscorefile_bash"
cat ASCII/CF_opening.txt
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
notify-send "Heads!"
echo "Computer chose heads."
else
notify-send "Tails!"
echo "Computer chose tails."
fi
if [ $computer_choice -eq 1 ] && [ $user_choice = h ]; then
# Correct & Desktop Notifaction & ASCII
cat ASCII/CF_correct.txt
echo "You win!"
notify-send "your getting Clairvoyant :)"
elif [ $computer_choice -eq 1 ] && [ $user_choice = t ]; then
# Incorrect & Desktop Notifaction & ASCII
cat ASCII/CF_incorrect.txt
echo "You lose!"
notify-send "Concentrate Harder! :("
exit
elif [ $computer_choice -eq 2 ] && [ $user_choice = t ]; then
# Correct & Desktop Notifaction & ASCII
cat ASCII/CF_correct.txt
echo "You win!"
notify-send "your getting Clairvoyant :)"
else
# Incorrect & Desktop Notifaction & ASCII
cat ASCII/CF_incorrect.txt
echo "You lose!"
notify-send "Concentrate Harder! :("
exit
fi
# Save High Score & ASCII
cat ASCII/CF_scorefile.txt
read -p "Please enter your name: " name
echo $name $user_choice >> $scorefile
# print High Score
echo -e "\nPrevious high scores,"
cat $scorefile
