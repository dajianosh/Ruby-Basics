# doubling elemtns of array using map function
arr = Array[1, 2, 3, 4, 5]
puts arr.map  {|num| num * 2 }
# handling corner cases
arr1 = Array[1, 2, 3, 4, 5, nil]
double = arr1.map do |a|
  if a.is_a? Integer
    a * 2
  else
    a = a 
  end
end    
puts double
