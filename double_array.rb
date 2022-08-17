# doubling elemtns of array using map function
arr = Array[1, 2, 3, 4, 5]
puts "#{arr.map  {|num| num*2 } }"
# handling corner cases
arr1 = Array[1, 2, 3, 4, 5, "Anosh"]
double = arr1.map do |a|
  if a.is_a?(String)
    a = a
  else 
    a * 2	
  end
end  
puts "#{double}"
