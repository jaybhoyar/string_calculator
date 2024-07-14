# lib/string_calculator.rb
require 'error'
require 'helpers/string_calculator_helper'

module StringCalculator
  extend Error
  extend StringCalculatorHelper

  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?
    raise_argument_error if invalid_newlines?(numbers)

    sanitized_numbers = remove_newlines(numbers)
    sanitized_numbers.split(",").map(&:to_i).sum
  end
end
