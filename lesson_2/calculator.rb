def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.nonzero?
end

def operation_to_message(op)
  case op
  when 'add'
    'Adding'
  when 'subtract'
    'Subtracting'
  when 'multiply'
    'Multiplying'
  when 'divide'
    'Dividing'
  end
end

prompt("Welcome to the Calculator. Enter your name")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure you use a valid name."
  else
    break
  end
end

prompt "Hello #{name}"

loop do # Main Loop
  answer_1 = ''
  loop do
    prompt "Please enter first number"
    answer_1 = gets.chomp.to_i

    if valid_number?answer_1
      break
    else
      prompt "Your number is not valid"
    end
  end

  answer_2 = ''
  loop do
    prompt "Please enter second number"
    answer_2 = gets.chomp.to_i

    if valid_number?answer_2
      break
    else
      prompt "Your number is not valid"
    end
  end

  operator_prompt = <<-MSG
  Which operation would you like to try?
    add
    subtract
    multiply
    divide
  MSG

  prompt operator_prompt

  operation = ''
  loop do
    operation = gets.chomp

    if %w(add subtract multiply divide).include?(operation)
      break
    else
      prompt("Must choose one of the four operations only:
         add, subtract, multiply, divide")
    end
  end

  prompt("#{operation_to_message(operation)}...")

  result = case operation
           when 'add'
             answer_1 + answer_2
           when 'subtract'
             answer_1 - answer_2
           when 'multiply'
             answer_1 * answer_2
           when 'divide'
             answer_1.to_f / answer_2.to_f
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? ('y' to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator")
