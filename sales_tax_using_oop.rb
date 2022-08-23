$LOAD_PATH << '.'

require 'user_input.rb'
require 'tax_calculations.rb'

#main
i_obj = Input.new           #object of Input Class
tax = Tax.new               #object of Tax Class
details = i_obj.user_input
tax.calculate_tax(details)
