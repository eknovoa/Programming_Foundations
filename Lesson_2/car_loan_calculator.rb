require 'yaml'
MESSAGES = YAML.load_file('car_loan_calc_messages.yml')

def prompt(messages)
  puts("=> #{messages}")
end

def monthly_int_rate(rate)
  int_rate = (rate.to_f() / 12) / 100

  int_rate
end

def loan_dur_mths(loan_time)
  loan_time_mths = loan_time.to_f() * 12

  loan_time_mths
end

def calculator(amount, rate, loan_time)
  amount = amount.to_f()
  rate = rate.to_f()
  loan_time = loan_time.to_f()
  monthly_pmt = amount * (rate / (1 - (1 + rate)**(-loan_time)))

  monthly_pmt.round(2)
end

def clear_screen(answer_again)
  if answer_again.downcase == 'y'
    system('clear') || system('cls')
  end
  answer_again
end

def valid_num(num)
  loop do
    if num.empty?()
      prompt(MESSAGES['valid_number'])
      num = Kernel.gets().chomp()
    else
      break
    end

    if num.match?(/\A-?\d+\Z/)
      break
    else
      prompt(MESSAGES['valid_number'])
      num = Kernel.gets().chomp()
    end
  end
  num
end

def valid_name(first_name)
  loop do
    if first_name.empty?()
      prompt(MESSAGES['valid_name'])
      first_name = Kernel.gets().chomp()
    else
      break
    end

    if first_name.match?(/\A-?\d+\Z/)
      prompt(MESSAGES['valid_name'])
      first_name = Kernel.gets().chomp()
    else
      break
    end
  end
  first_name
end

prompt(MESSAGES['welcome'])

loop do
  prompt(MESSAGES['first_name'])
  name = Kernel.gets().chomp()
  name = valid_name(name)
  prompt("Hi, #{name.capitalize}!")

  prompt(MESSAGES['retrieve_info'])
  prompt(MESSAGES['confirmation'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

  prompt(MESSAGES['loan_amount'])
  amount = Kernel.gets().chomp()
  amount = valid_num(amount)

  prompt(MESSAGES['percentage_rate'])
  apr = Kernel.gets().chomp()
  apr = valid_num(apr)

  prompt(MESSAGES['loan_duration'])
  loan_duration = Kernel.gets().chomp()
  loan_duration = valid_num(loan_duration)

  rate = monthly_int_rate(apr)
  loan_dur = loan_dur_mths(loan_duration)
  prompt("Your monthly payment is: $#{calculator(amount, rate, loan_dur)}.")

  prompt(MESSAGES['another_calc'])
  answer_again = Kernel.gets().chomp()
  break unless answer_again.downcase().start_with?('y')
  clear_screen(answer_again)
end

prompt(MESSAGES['goodbye'])
