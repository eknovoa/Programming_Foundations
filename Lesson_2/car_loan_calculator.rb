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

def calculator(amount, apr_rate, loan_time)
  amount = amount.to_f()
  apr_rate = apr_rate.to_f()
  loan_time = loan_time.to_f()
  monthly_pmt = amount * (apr_rate / (1 - (1 + apr_rate)**(-loan_time)))
  monthly_pmt.round(2)
end

def clear_screen(answer_again)
  if answer_again.downcase == 'y'
    system('clear') || system('cls')
  end
  answer_again
end

def valid_name?(n)
  char_num = "0-9!#$%&'()*+,-./:;<=>?@[]^_`{|}~"
  loop do
    if n.count('a-zA-z') > 0 && n.count(char_num) == 0
      break
    elsif n.count(char_num) > 0 || n.empty?() || n.count("a-zA-Z") > 0
      prompt(MESSAGES['invalid_number'])
      n = Kernel.gets().chomp()
    end
  end
  n
end

def valid_loan_amt?(l)
  char_lett = "a-zA-Z!#$%&'()*+,-./:;<=>?@[]^_`{|}~"
  loop do
    if l.to_i > 0 && l.count(char_lett) == 0
      break
    elsif l.empty?() || l.count(char_lett)
      prompt(MESSAGES['invalid_number'])
      l = Kernel.gets().chomp()
    end
  end
  l
end

def valid_apr_dur?(num)
  char_lett = "a-zA-Z!#$%&'()*+,-./:;<=>?@[]^_`{|}~"
  loop do
    if num.to_i.between?(1, 100) && num.count(char_lett) == 0
      break
    elsif num.count("0-9") > 0 || num.count(char_lett) > 0 || num.empty?()
      prompt(MESSAGES['invalid_number'])
      num = Kernel.gets().chomp()
    end
  end
  num
end

def valid_input?(input, input_type)
  case input_type
  when "loan_amt"
    valid_loan_amt?(input)
  when "apr"
    valid_apr_dur?(input)
  when "duration"
    valid_apr_dur?(input)
  end
end

prompt(MESSAGES['welcome'])

loop do
  prompt(MESSAGES['first_name'])
  name = Kernel.gets().chomp()
  name = valid_name?(name)
  prompt("Hi, #{name.capitalize}!")

  prompt(MESSAGES['retrieve_info'])
  prompt(MESSAGES['confirmation'])
  answer = Kernel.gets().chomp()

  if answer != 'y' && answer != 'n'
    loop do
      prompt(MESSAGES['invalid_response'])
      answer = Kernel.gets().chomp().downcase()
      break if answer.start_with?('y') && answer.size == 1
      break if answer.start_with?('n') && answer.size == 1
    end
  end
  break unless answer.start_with?('y') && answer.size == 1

  prompt(MESSAGES['loan_amt'])
  amount = Kernel.gets().chomp()
  amount = valid_input?(amount, "loan_amt")

  prompt(MESSAGES['percentage_rate'])
  apr = Kernel.gets().chomp()
  apr = valid_input?(apr, "apr")

  prompt(MESSAGES['loan_duration'])
  loan_duration = Kernel.gets().chomp()
  loan_duration = valid_input?(loan_duration, "duration")

  apr_rate = monthly_int_rate(apr)
  loan_dur = loan_dur_mths(loan_duration)
  prompt("Your monthly payment is: $#{calculator(amount, apr_rate, loan_dur)}.")

  prompt(MESSAGES['another_calc'])
  answer_again = Kernel.gets().chomp()

  if answer_again != 'y' && answer_again != 'n'
    loop do
      prompt(MESSAGES['invalid_response'])
      answer_again = Kernel.gets().chomp().downcase()
      break if answer_again.start_with?('y') && answer_again.size == 1
      break if answer_again.start_with?('n') && answer_again.size == 1
    end
  end
  break unless answer_again.start_with?('y') && answer_again.size == 1
  clear_screen(answer_again)
end

prompt(MESSAGES['goodbye'])
