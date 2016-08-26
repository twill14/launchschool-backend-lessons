# Ask for two numbers
# Ask for an operation to use on the two numbers
# Perform the operation on the two numbers
# Display the result of the operation


puts "Welcome to the Calculator. Please enter first number"
answer_1 = gets.chomp.to_i

puts "Please enter second number"
answer_2 = gets.chomp.to_i


puts "Please choose and operation: (add, subtract, multiply, divide)"

operation = gets.chomp

if operation == 'add'
  result = answer_1 + answer_2
end

if operation == 'subtract'
  result = answer_1 - answer_2
end

if operation == 'multiply'
  result = answer_1 * answer_2
end

if operation == 'divide'
  result = answer_1.to_f / answer_2.to_f
end
  
  puts "The result is #{result}"

