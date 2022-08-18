arr = [1, 2, 3, 4, 4, 5, 4, 4, 3, 2, 4, 5, 6, 2, 3, 4, 5, 6]
val = Hash.new(0)
arr.each {|num| val[num] = val[num] + 1}
puts val
