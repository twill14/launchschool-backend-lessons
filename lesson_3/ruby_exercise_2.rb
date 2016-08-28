######## Question 1 #######
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot")

######## Question 2 #######
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = 0;

ages.each do |key, val |
  total_age += val
end

puts total_age

######## Question 3 #######
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if {|key, value| value >= 100 } 
end

####### Question 4 ########
munsters_description = "The Munsters are creepy in a good way."

munsters_description.sub "The Munsters are creepy in a good way." , 
"The munsters are creepy in a good way."

munsters_description.sub "The Munsters are creepy in a good way." , 
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.sub "The Munsters are creepy in a good way." , 
"the munsters are creepy in a good way."

munsters_description.sub "The Munsters are creepy in a good way." , 
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

####### Question 5 ########
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

p ages

####### Question 6 ########
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum = ages["Herman"];

ages.each do |key, val|
  if val < minimum
    minimum = val
  else
    next
  end
end

p minimum

####### Question 7 ########

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino")


####### Question 8 ########

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

result = '';

flintstones.each do |x|
  if x.start_with?("Be")
    result =  flintstones.index(x)
  end
end

p result


####### Question 9 ########
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |x|
  x[0,3]
end

p flintstones

####### Question 10 ########
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|x| x[0,3]}
end

p flintstones
















































####### Question 5 ########