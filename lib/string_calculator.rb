# lib/string_calculator.rb

module StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    numbers.split(",").map(&:to_i).sum
  end
end
