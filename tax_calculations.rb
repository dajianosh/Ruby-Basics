class Tax
  def calculate_tax(input_details)
    final_price = 0.0
    total_tax = 0.0

    for item in input_details
      temp = item.split
      quantity = Float(temp[0]) 
      product_price = Float(temp.last)
      product_name = temp.slice(1, temp.length - 3)
  
      i_tax = import_tax(product_name, product_price)
      s_tax = sales_tax(product_name, product_price)
  
      total_tax += s_tax + i_tax 
      final_price += ((product_price + s_tax + i_tax) * quantity)

      puts "#{ quantity.to_i } #{ product_name.join(' ') }: #{ ((product_price + s_tax + i_tax) * quantity).round(2) }"
    end

    puts "Sales Tax: #{ (total_tax * quantity).round(2) }" 
    puts "Total: #{ (final_price).round(2) }"
  end   

  private
  def import_tax(product_name, product_price) #checking imported or not and returning import tax if applicable
    return 0.05 * product_price if product_name.include? "imported"
    return 0.0            
  end
  
  def sales_tax(product_name, product_price) #checking product exempted from sales tax or not and returning the applicable sales tax
    flag = false
    for i in %w(Book book books headache pill chocolate Chocolate chocolates Chocolates box)
      if product_name.include? i
        flag = true 
        break
      end
    end  
    return flag ? 0.0 : (0.1 * product_price)
  end 

end
