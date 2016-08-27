require 'yaml'

SYSTEM = YAML.load_file('loan_calculator_messages.yml')

def validate_number?(num)
  Integer(num) rescue false
end

def system_prompt(message)
  puts "-- #{message} --"
end

def validate_percent?(num)
  Float(num) rescue false
end

def monthly_interest_rate(apr)
   apr /= 100
   apr /= 12
end

def calculation_method(la, mir, ldm)
  result = la * (mir / (1 - (1 + mir)**-ldm))
  return result
end

def loan_duration_month(dur)
  dur * 12
end

system_prompt(SYSTEM['welcome'])

loop do
  loan_amount = ''
    loop do
      system_prompt(SYSTEM['loan_amount'])
      loan_amount = gets.chomp.to_i
      if validate_number? loan_amount
        break
      else
        system_prompt(SYSTEM['invalid_number'])
      end
    end

  loan_apr = ''
    loop do
      system_prompt(SYSTEM['loan_apr'])
      loan_apr = gets.chomp.to_f
      if validate_percent? loan_apr
        break
      else
        system_prompt(SYSTEM['loan_apr_invalid'])
      end
    end

    loan_duration = ''
    loop do
      system_prompt(SYSTEM['loan_duration'])
      loan_duration = gets.to_i
      if validate_number? loan_duration
        break
      else
        system_prompt(SYSTEM['invalid_number'])
      end
    end

  mir = monthly_interest_rate(loan_apr)
  dur = loan_duration_month(loan_duration)

  puts "Calculating..."

  result = calculation_method(loan_amount, mir, dur)

  system_prompt "The answer is $#{format('%02.2f', result)}"

  system_prompt(SYSTEM['try_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

system_prompt(SYSTEM['thank_you'])