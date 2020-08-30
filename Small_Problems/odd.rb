def is_odd?(int)
  int.remainder(2) != 0
end

# test cases
puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(0)
