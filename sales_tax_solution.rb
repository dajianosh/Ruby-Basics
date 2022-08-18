# general

products = ["perfume","Music CD"]
medical_products =["headache", "pills"]
food_products = ["Chocolate","Chocolates","chocolate","chocolates"]
exempted_products = ["Book","book"] + medical_products + food_products
total_price = 0.0
sales_tax = 0.0
import_tax = 0.0
def import_tax (product_name)
  import_flag = false
  if product_name.include? "imported"         #checking imported or not
      import_flag = true     
  end
  return import_flag        
end

def check_exemption(product_name, exempted_products)
  exempted_flag =  false
  for i in exempted_products
    if product_name.include? i
      exempted_flag = true  
    end    
  end
  return exempted_flag
end    
  
#input
puts "Enter product details:"
input = Array.new
while (product_details = gets.chomp) != 'exit'
  input.push(product_details) 
end  
# puts input
# for loop for different inputs
for item in input
  temp = item.split
  quantity = Float(temp[0])
  product_price = Float(temp.last)
  product_name = temp.slice(1, temp.length-3)
  
  # calculating import and sales tax
  import_flag = import_tax (product_name)
  exempted_flag = check_exemption(product_name, exempted_products)

  if import_flag == true and exempted_flag == false
    tax = 0.15 * product_price  
    product_price = product_price + tax
  elsif import_flag == true and exempted_flag == true
    tax = 0.05 * product_price
    product_price = product_price + tax
  elsif import_flag == false and exempted_flag == false
    tax = 0.1 * product_price
    product_price = product_price + tax 
  else 
    tax = 0 * product_price
    product_price = product_price + tax
  end   
  total_price = (total_price + product_price) * quantity
  sales_tax = sales_tax + tax 
  
  # output
 # puts "Output:"
  puts "#{quantity.to_i} #{product_name.join(' ')}: #{product_price.round(2)}"
end  
 
  puts "Sales Tax: #{(sales_tax).round(2)}"
  puts "Total:#{(total_price).round(2)}"
