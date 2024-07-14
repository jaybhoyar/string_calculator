
module StringCalculatorHelper
  def invalid_newlines?(string)
    string.start_with?("\n") || string.end_with?("\n") || string.include?(",\n") || string.include?("\n,")
  end

  def remove_newlines(numbers)
    numbers.gsub("\n", ",")
  end

  def extract_delimiters(numbers)
    default_delimiters = /,|\n/

    if numbers.start_with?("//")
      delimiter_spec, numbers = numbers.split("\n", 2)
      custom_delimiter = delimiter_spec[2..-1]
      delimiters = Regexp.escape(custom_delimiter)
    else
      delimiters = default_delimiters
    end

    [delimiters, numbers]
  end

  def check_for_negatives(numbers, delimiters)
    num_list = numbers.split(delimiters).map(&:to_i)
    negatives = num_list.select { |num| num < 0 }
    raise ArgumentError, "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
