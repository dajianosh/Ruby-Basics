# $LOAD_PATH << '.'

# require 'user_input.rb'
# require 'tax_calculations.rb'
require_relative "user_input.rb"
require_relative "tax_calculations.rb"

#main
input_details = Input.new.user_input
Tax.new.calculate_tax(input_details)
