
module StringCalculatorHelper
  def invalid_newlines?(string)
    string.start_with?("\n") || string.end_with?("\n") || string.include?(",\n") || string.include?("\n,")
  end

  def remove_newlines(numbers, delimiter)
    numbers.gsub("\n", delimiter)
  end

  def extract_delimiters(numbers)
    delimiter = ","

    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..-1])
      numbers = parts[1]
    end

    [delimiter, numbers]
  end

  def check_for_negatives(numbers, delimiter)
    num_list = numbers.split(delimiter).map(&:to_i)
    num_list.select { |num| num < 0 }
  end
end
