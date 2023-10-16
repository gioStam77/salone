#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~~~~GIO'S SALONE~~~~~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  echo -e "1) Haircut\n2) Massage\n3) Nails\n4) EXIT\n"
read SERVICE_ID_SELECTED
case $SERVICE_ID_SELECTED in
  1) HAIRCUT ;;
  2) MASSAGE ;;
  3) NAILS ;;
  4) EXIT ;;
  *) MAIN_MENU  ;;
esac
}
HAIRCUT(){
 echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        #if customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then 
        #get new customer name 
    echo "What's your name?"
    read CUSTOMER_NAME
        #insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name)VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')") 
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone ='$CUSTOMER_PHONE'")
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED") 
  echo -e "What time to you like your $SERVICE_NAME ,$CUSTOMER_NAME" 
  read SERVICE_TIME
  INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time)VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"   
  }
 MASSAGE(){
 echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        #if customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then 
        #get new customer name 
    echo "What's your name?"
    read CUSTOMER_NAME
        #insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name)VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')") 
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone ='$CUSTOMER_PHONE'")
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED") 
  echo -e "What time to you like your $SERVICE_NAME ,$CUSTOMER_NAME" 
  read SERVICE_TIME
  INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time)VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"   
 } 
NAILS(){
  echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        #if customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then 
        #get new customer name 
    echo "What's your name?"
    read CUSTOMER_NAME
        #insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name)VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')") 
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone ='$CUSTOMER_PHONE'")
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED") 
  echo -e "What time to you like your$SERVICE_NAME ,$CUSTOMER_NAME" 
  read SERVICE_TIME
  INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time)VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME , $CUSTOMER_NAME.\n"   
}
EXIT(){
echo -e "\nThank you for stopping in.\n"
}
MAIN_MENU
