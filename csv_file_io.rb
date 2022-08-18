# reading file
a_file = File.new("sampleCSV.csv", "r+")
if a_file
  content = a_file.sysread(100)
  puts content
else	
  puts "Unable to add file"
end

# writing file
a_file = File.new("sampleCSV.csv", "a")
if a_file
  a_file.syswrite("Roger,Federer,24")
else
  puts "Unable to open file"
end
