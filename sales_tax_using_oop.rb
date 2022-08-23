class Tax
  def import_tax(product_name, product_price) #checking imported or not and returning import tax if applicable
    return 0.05 * product_price if product_name.include? "imported"
    return 0.0            
  end
  
  def sales_tax(product_name, product_price) #checking product exempted from sales tax or not and returning the applicable sales tax
    flag = false
    for i in $exempted_products
      if product_name.include? i
        flag = true 
        break
      end
    end  
    return flag ? 0.0 : (0.1 * product_price)
  end 
end

class Input
  def user_input
    puts "Enter product details:"
    input = Array.new
    while(product_details = gets.chomp) != 'exit'
      input.push(product_details) 
    end 
    return input   
  end  
end

#main
$exempted_products = %w(Book book books headache pill chocolate Chocolate chocolates Chocolates box)
final_price = 0.0
total_tax = 0.0

i_obj = Input.new           #object of Input class
tax = Tax.new               #object of Tax class
input = i_obj.user_input
for item in input
  temp = item.split
  quantity = Float(temp[0]) 
  product_price = Float(temp.last)
  product_name = temp.slice(1, temp.length - 3)

  
  i_tax = tax.import_tax(product_name, product_price)
  s_tax = tax.sales_tax(product_name, product_price)
  
  total_tax = total_tax + s_tax + i_tax 
  final_price += ((product_price + s_tax + i_tax) * quantity)
  # output
  puts "#{ quantity.to_i } #{ product_name.join(' ') }: #{ ((product_price + s_tax + i_tax) * quantity).round(2) }"
end 

puts "Sales Tax: #{ (total_tax * quantity).round(2) }" 
puts "Total: #{ (final_price).round(2) }"
