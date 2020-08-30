def reverse_words(string)
  new_string = string.split

  new_string.each do |str|
    str.gsub!(str.reverse!) if str.length >= 5
  end
  new_string.join(' ')
end


# test cases
p reverse_words('Professional')
p reverse_words('Walk around the block')
p reverse_words('Launch School')
