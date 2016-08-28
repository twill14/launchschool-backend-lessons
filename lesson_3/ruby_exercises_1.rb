########### Question 1 ###########
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# => [1, 2, 2, 3]

# uniq did not mutate the array, so it only displays the original numbers. 

########### Question 2 ###########
1. what is != and where should you use it? 
2. put ! before something, like !user_name
3. put ! after something, like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something, like !!user_name

1. # Is 'not equal'. This can be used in logical reasoning. For example, proving that a variable is not equal to 
# number: my_var != 3

2. # If used before a variable, it means not "that variable", or if that variable is false. 
# if user_name = true means taht user_name has been assigned a value !user_name, means that it has not yet been assigned one

3. # Sometimes ! after a method can mean that the method it is attached to will mutate the object it is attacehd to
# or in other words, makes it "descructive". Otherwise, it's only a naming convention

4. # Puting ? before something, can be used in ternary logic var ? 2 : 3

5. # For methods, it doesn't mean anything, just a naming convention. ? after a variable can be used for ternary operations

6. # Turns a variable into its boolean equivalent

########### Question 3 ###########

advice = "Few things in life are as important as house training your pet dinosaur."

advice ["important"] = "urgent"

puts advice

########### Question 4 ###########

numbers = [1,2,3,4,5]

numbers.delete_at(1)

puts numbers

# Is destructive, removes the number at the 1st index.

numbers = [1,2,3,4,5]

numbers.delete(1)

puts numbers

# Is destructive, removes the first entry in the array

########### Question 5 ###########

(10..100).include?(42) # => true

########### Question 6 ###########

# One way
famous_words = "seven years ago..."

other_famous_words = "Four score and "

all_famous_words = other_famous_words + famous_words

puts all_famous_words

# Another way

complete_famous_words = "Four score and "

famous_words = "seven years ago..."

complete_famous_words << famous_words

puts complete_famous_words


########### Question 7 ###########

def add_eight(number)
  number + 8
end

number = 2

how_deep = 2

how_deep = "number"

5.times {how_deep.gsub!("number", "add_eight(number)")}

p how_deep

eval(how_deep) # => 42

########### Question 8 ###########

flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

flintstones.flatten! # => ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"] 


########### Question 9 ###########

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones_array = []

flintstones.each do |key, val|
if key == "Barney"
flintstones_array.push(key)
flintstones_array.push(val)
end
end


p flintstones_array # => ["Barney", 2]

# OR
flintstones.assoc(Barney)


########### Question 10 ###########

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_h = {}

flintstones.each_with_index do |item, index|
  flintstones_h[item] = index
end

p flintstones_h #  => {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Pebbles"=>4, "BamBam"=>5}




