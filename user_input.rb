class Input
  def user_input
    puts "Enter product details:"
    input = Array.new
    while(product_details = gets.chomp) != 'exit'
      input.push(product_details) 
    end 
    input   
  end  
end
