########## Question 1 #############
statement = "The Flintstones Rock!"

10.times do |x|
  statement.insert(0," ")
  puts statement
end

########## Question 2 #############
statement = "The Flintstones Rock"

hash = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
letter_frequency = statement.scan(letter).count
hash[letter] = letter_frequency if letter_frequency > 0
end

p hash

########## Question 3 #############
# The reason for the error is because, you cannot conatanate a string with a non-string object.

puts "the value of 40 + 2 is " + (40 + 2).to_s



puts "the value of 40 + 2 is #{40 + 2}"

########## Question 4 #############

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# Modifying an array while iterating over it affects the iterative process by altering which 
#items get iterated over.
# This above code outputs 1 and 3. And then mutates the array to [3,4], this is due to the shift method deleting the first two elements from the original array.


numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# This above code outputs 1 and 2.
#Then it leaves [1,2]
# This is because the pop method removed the 3 and 4 before it had any chance to iterate over them in the each method

########## Question 5 #############

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end 
   divisors
end


# The purpose of number % dividend == 0 is meant to check if the number divded by the divided leaves a remainder.
# Not doing so means that the dividend is evenly divisible.

# Methods always return the last line in the method. So this makes sure that the divsors array is returned once the method is called

########## Question 6 #############
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# I would prefer the second method. The first methods is using a shadow variable, so that the input that is
#used as an arguement will not be the same output that is returned. The second one will retain its original value
# as the 


######## Question 7 #########

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"


######## Question 8 #########

def titleize(string)
  temp_array = string.split(" ")

  temp_array.map! {|x| x.to_s.capitalize}.join(' ')
end

######## Question 9 #########
# Iterate through each element in the hash
# Look at the age in each hash element and determine if it falls within the range of 0-17, 18-64, and 65+
# Case if, 0-17 add a new key value pair to the selected hash element with key value pair of "age_group" and value

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, val|
  case munsters[key]["age"]
  when 0..17 then munsters[key]["age_group"] = "child"
  when 18..64 then munsters[key]["age_group"] = "adult"
  else
    munsters[key]["age_group"] = "senior"
  end
end























