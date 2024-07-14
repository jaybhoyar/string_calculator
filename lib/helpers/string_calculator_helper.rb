
module StringCalculatorHelper
  def invalid_newlines?(string)
    string.start_with?("\n") || string.end_with?("\n") || string.include?(",\n") || string.include?("\n,")
  end
  
  def remove_newlines(numbers)
    numbers.gsub("\n", ",")
  end
end
