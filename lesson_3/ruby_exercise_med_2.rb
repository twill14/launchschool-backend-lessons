###### Question 1 ######

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0;

munsters.each do |key, val|
  age_int = munsters[key]["age"].to_i
  total_age += age_int
end

puts total_age

###### Question 2 ######
# Iterate through each item in the hash, 
# Isolate each key (val), for each, isolate in a value that can be referenced in a puts statement

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, val|
  puts "#{key} is a #{val["age"]} year old and is a #{val["gender"]}."
  puts "-------------"
end


##### Question 3 ######

def string_add_rutabaga(a_string_param)
  a_string_param << " rutabaga"
end

def array_add_rutabaga(an_array_param)
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]

string_add_rutabaga(my_string)
array_add_rutabaga(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

##### Question 4 ######

sentence = "Humpty Dumpty sat on a wall."

# Attempt one
temp_array = sentence.split('')

temp_array.reverse!  {|x|}.join(' ')  + '.'

# Revised Attempt
temp_array = sentence.split(/\W/)

temp_array.reverse!  {|x|}.join(' ')  + '.'

###### Quesion 5 ######

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

#34, we called for answer. We should have called for new answer. Methods can't overwrite values unless directly specified.

###### Quesion 6 ######

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# Inserting parameters in this method leverages the data by reference. demo_hash points to munters hash object ID
# Because of this, any alteration to demo_hash, also affects munsters

######## Question 7 ########
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# paper, paper, rock => paper


######## Question 8 ########
def foo(param = "no")
  "yes" #Returns yes
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo) # => "no"

#bar(foo) = bar("yes") 
# "yes" = "no" = no
