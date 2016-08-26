#Casual

while user wants to keep goin
  - ask user for a collection
  -Run subprocess : extract largest number from the collection
  - Save largest number to a list 
  - Ask if they want to add another list

Print Collection List
End


while user wants to keep goin
  - ask user for a collection
  -Run subprocess
    - iterate through the collection one by one
    - set saved variable to the first entry in the collection
    - compare saved variable to the next variable in the iteration
    - If variable in iteration is greater than saved variable, change saved variable to iteration number
    - Skip iteration if not the case
  
  - Save largest number to a list 
  - Ask if they want to add another list

Print Collection List
End


#Formalize (top)


SET keep_going = true
SET collection_list = []

While keep_going = true

Get "Enter collection"
SET Collection

SET largest_Number = subprocess

largest_number.push(collection_list)

Get"Add another collection?"

if yes
  keep_going = true
Else
  keep_going = false

if keep_going = false 
  exit loop


  Print collection_list


# Casual Calculator

- Get first number 
 - Make sure that it is valid
- Get second number 
 - Make sure that it is valid
- Get operator 
 - Make sure that it is valid

Perform operation on the two numbers

Display result

Ask user if they want to do another calculation

  
