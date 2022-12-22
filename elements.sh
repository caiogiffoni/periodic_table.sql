
#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# # IF THERE IS AN ARGUMENT
# if [[ $1 ]]
#   then
#     # IF IT IS A NUMBER
#     if [[ $1 =~ ^[0-9]+$ ]]
#     then
#       SEARCH_TERM='atomic_number'
#     fi
#     if [[ $1 =~ ^[A-Z]$ || $1 =~ ^[A-Z][a-z]$ ]]
#     then
#       SEARCH_TERM='symbol'
#     fi

#     if [[ $1 =~ ^[A-Z][a-z][a-z]+$ ]]
#     then 
#       SEARCH_TERM='name'
#     fi

#     ELEMENT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE $SEARCH_TERM = $1")
#     if [[ $ELEMENT ]]
#     then
#       echo "$ELEMENT" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR ATOMIC_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
#       do
#         echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
#       done
#     else
#     echo "I could not find that element in the database."
#     fi
#   else
#     echo "Please provide an element as an argument."
# fi




# IF THERE IS AN ARGUMENT
if [[ $1 ]]
  then
    # IF IT IS A NUMBER
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      ELEMENT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = $1")
      if [[ $ELEMENT ]]
      then
        echo "$ELEMENT" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR ATOMIC_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      else
      echo "I could not find that element in the database."
      fi
    fi
    if [[ $1 =~ ^[A-Z]$ || $1 =~ ^[A-Z][a-z]$ ]]
    then
      ELEMENT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol = '$1'")
      if [[ $ELEMENT ]]
      then
        echo "$ELEMENT" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR ATOMIC_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      else
      echo "I could not find that element in the database."
      fi
    fi
    if [[ $1 =~ ^[A-Z][a-z][a-z]+$ ]]
    then
      ELEMENT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE name = '$1'")
      if [[ $ELEMENT ]]
      then
        echo "$ELEMENT" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR ATOMIC_NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      else
      echo "I could not find that element in the database."
      fi
    fi
    if [[ ! $1 =~ ^[A-Z][a-z]+$ && ! $1 =~ ^[A-Z]$ && ! $1 =~ ^[A-Z][a-z]$  && ! $1 =~ ^[0-9]+$ ]]
    then
      echo "I could not find that element in the database."
    fi

  else
    echo "Please provide an element as an argument."
fi
