########## Question 1 ############
if false
  greeting = “hello world”
end

greeting


# Greeting should nil. It was never defined. Though in a bloc, the if statment will never initialize.

########## Question 2 ############
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Greetings should be equal to "hi there", this is because we mutated the value by reference using the << key.

########## Question 3 ############

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# One is still one
# Two should still be two
# Three should still be three.

#Method won't affect the original value of these variables, especially when the are only assigned to new ones. 
#Those new values are only availble in the method.

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# One is still one
# Two should still be two
# Three should still be three.

#Method won't affect the original value of these variables, especially when the are only assigned to new ones. 
#Those new values are only availble in the method.


def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# One is two
# Two should be three
# Three should be one

########## Question 4 ############

#ORIGINAL 
def uuid_gen()
slot_one = []
slot_two = []
slot_three = []
slot_four = []
slot_five = []
  counter_one = 0
  counter_two=0
  counter_three=0
  counter_four=0
  counter_five=0
  while counter_one < 8  do
    val = [('a'..'z'),(0..9)].map{|i| i.to_a}.join
    slot_one << val[rand(val.length)]
    counter_one += 1
  end
  while counter_two < 4 do
    val = [('a'..'z'),(0..9)].map{|i| i.to_a}.join
    slot_two << val[rand(val.length)]
    counter_two += 1
  end
  while counter_three < 4  do
    val = [('a'..'z'),(0..9)].map{|i| i.to_a}.join
    slot_three << val[rand(val.length)]
    counter_three += 1
  end
  while counter_four < 4  do
    val = [('a'..'z'),(0..9)].map{|i| i.to_a}.join
    slot_four << val[rand(val.length)]
    counter_four += 1
  end
  while counter_five < 12  do
    val = [('a'..'z'),(0..9)].map{|i| i.to_a}.join
    slot_five << val[rand(val.length)]
    counter_five += 1
  end
    return "#{slot_one.join}-#{slot_two.join}-#{slot_three.join}-#{slot_four.join}-#{slot_five.join}"
end


#REVISED AFTER RESEARCH
def uuid_gen()
o =  [('a'..'z'),(0..9)].map{|i| i.to_a}.flatten
string_one  =  (0...8).map{ o[rand(o.length)]  }.join
string_two  =  (0...4).map{ o[rand(o.length)]  }.join
string_three  =  (0...4).map{ o[rand(o.length)]  }.join
string_four  =  (0...4).map{ o[rand(o.length)]  }.join
string_five  =  (0...12).map{ o[rand(o.length)]  }.join
return "#{string_one}-#{string_two}-#{string_three}-#{string_four}-#{string_five}"
end


########## Question 5 ############

def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")  
  false unless dot_separated_words.length == 4
  
  while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      false unless !is_number?(word)
  end
  
      return true
end

