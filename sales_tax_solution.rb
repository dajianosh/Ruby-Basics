# general
exempted_products = %w(Book book headache pill chocolate Chocolate chocolates Chocolates box)
final_price = 0.0
total_tax = 0.0

def check_imported(product_name, product_price) #checking imported or not and returning import tax if applicable
  import_tax = 0.0
  if product_name.include? "imported"           
    import_tax = 0.05 * product_price
  end
  return import_tax 
end

def check_exemption(product_name, exempted_products, product_price) # checking product exempted from sales tax or not
  exempted_flag = false
  sales_tax = 0.0
  for i in exempted_products
    if product_name.include? i
      exempted_flag = true 
    end  
  end
  if exempted_flag == false                # calculating sales tax for non exempted products
    sales_tax = 0.1 * product_price
  end  
  return sales_tax
end    
  
#input
puts "Enter product details:"
input = Array.new
while (product_details = gets.chomp) != 'exit'
  input.push(product_details) 
end  

# for loop for different inputs
for item in input
  temp = item.split
  quantity = Float(temp[0])
  product_price = Float(temp.last)
  product_name = temp.slice(1, temp.length-3)

  i_tax = check_imported(product_name, product_price)
  s_tax = check_exemption(product_name, exempted_products, product_price)
  
  
  total_tax = total_tax + s_tax + i_tax 
  product_price = product_price + s_tax + i_tax
  final_price += (product_price * quantity)
  # output
  puts "#{quantity.to_i} #{product_name.join(' ')}: #{product_price.round(2)}"
end  
 
puts "Sales Tax: #{(total_tax).round(2)}"
puts "Total:#{(final_price).round(2)}"