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


