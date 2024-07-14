# lib/string_calculator.rb
require 'error'
require 'helpers/string_calculator_helper'

module StringCalculator
  extend Error
  extend StringCalculatorHelper

  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?
    raise_argument_error if invalid_newlines?(numbers)

    delimiter, numbers = extract_delimiters(numbers)
    sanitized_numbers = remove_newlines(numbers, delimiter)

    negatives = check_for_negatives(sanitized_numbers, delimiter)
    raise_argument_error("Negatives not allowed: #{negatives.join(', ')}") unless negatives.empty?

    sanitized_numbers.split(delimiter).map(&:to_i).sum
  end
end
