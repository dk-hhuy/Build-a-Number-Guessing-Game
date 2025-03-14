#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER_NAME

# Check if user exists in DB
USER_INFO=$($PSQL "SELECT name FROM number WHERE name='$USER_NAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM number INNER JOIN games USING(user_id) WHERE name='$USER_NAME'")
BEST_GAME=$($PSQL "SELECT MIN(number_guess) FROM number INNER JOIN games USING(user_id) WHERE name='$USER_NAME'")

if [[ -z $USER_INFO ]]; then
  INSERT_USER=$($PSQL "INSERT INTO number(name) VALUES('$USER_NAME')")
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
else
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=1

while read NUMBER_GUESS; do

  # Check if input is a valid integer
  if ! [[ "$NUMBER_GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  else
    if [[ $NUMBER_GUESS -eq $SECRET_NUMBER ]]; then
        break
    else

      if [[ $NUMBER_GUESS -lt $SECRET_NUMBER ]]; then
          echo "It's higher than that, guess again:"
      elif [[ $NUMBER_GUESS -gt $SECRET_NUMBER ]]; then
          echo "It's lower than that, guess again:"
      fi
    fi
  fi
  ((GUESS_COUNT++))
done
if [[ $GUESS_COUNT == 1 ]]; then
  echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
else
  echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
fi
# Insert game result into DB
USER_ID=$($PSQL "SELECT user_id FROM number WHERE name='$USER_NAME'")
INSER_GAMES=$($PSQL "INSERT INTO games(user_id, number_guess) VALUES($USER_ID, $GUESS_COUNT)")
