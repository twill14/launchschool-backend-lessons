# Casual 1

# Collect two integers and store each in their own unique values 
# Define a method which accepts two arguements (our two integers)
# Within the method add the two integers together
# Return the result of the two added integers


#Formal 1

START 

GET integer_1 = 1

GET integer_2 = 1


# Define Method

SET method(arg1, arg2)
    
    ADD arg1 + arg2

    End Method


PRINT method(integer_1, integer_2)

END




# Casual 2

# Get Array
# Extract the individual strings from the array by iterating over the array and extracting each string
# Store extracted strings in a new variable, by adding the new extracted string to the previous string
# Return the result of the new variable composed of the concatenated strings


#Formal 2

START 

GET array = ['Hello', 'Goodbye']

SET Iterator = 1

SET String = nil

WHILE Iterator < length of array

 RETRIEVE array[index] at Iterator

 CONVERT array[index] TO string

 SET String += (array[index] To String)
    
 Iterator += 1


PRINT String 

END


# Casual 3

# Create first  Array
# Create second empty array 
# Iterate over the objects in the first array by their index
#For every other index in the array, extract the element from the array and push into the Second empty array
# Return the result of the second array

#Formal 3

START 

SET first_array = [1,2,3,4,5]

SET second_array = []

SET Iterator = 1

SET Counter = 2

WHILE Iterator < length of first_array

IF Counter is divisble by 2 with a remainder of 0
  extract the current value of first_array and load into second_array
ELSE
  go to next iteration

Iterator += 1
Counter += 1

END