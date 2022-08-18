# joining array without using inbuilt function
arr1 = Array(0..5)
arr2 =  Array(6..10)
result = arr1 + arr2
puts result

# joining array using inbuilt function
arr3 = Array["Hi", 5, "This is a string"]
arr4 = Array["Hello", 21, "Anosh", 33]
puts "#{arr3.concat(arr4)}"
