require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  Integer(num) rescue false
end

def number?(num)
  Float(num) rescue false
end

def operation_to_message(op)
 word = case op
           when 'add'
             'Adding'
           when 'subtract'
             'Subtracting'
           when 'multiply'
             'Multiplying'
           when 'divide'
             'Dividing'
        end
x = 'Random line of code'
return word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt "Hello #{name}"

loop do # Main Loop
  answer_1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    answer_1 = gets.chomp.to_i

    if valid_number?answer_1 and number? answer_1
      break
    else
      prompt(MESSAGES['valid_name'])
    end
  end

  answer_2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    answer_2 = gets.chomp.to_i

    if valid_number? answer_2 and number? answer_2
      break
    else
      prompt(MESSAGES['valid_name'])
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
      prompt(MESSAGES['operation_retry'])
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

  prompt(MESSAGES['try_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])
