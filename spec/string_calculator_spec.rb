require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
      expect(StringCalculator.add(nil)).to eq(0)
    end

    it "returns the number for a single number" do
      expect(StringCalculator.add("11")).to eq(11)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("5,6")).to eq(11)
    end

    it "returns the sum of multiple numbers" do
      expect(StringCalculator.add("5,6,8")).to eq(19)
    end

    it "handles new lines between numbers" do
      expect(StringCalculator.add("5\n6")).to eq(11)
      expect(StringCalculator.add("5\n6,8")).to eq(19)
    end

    it "throws error for invalid new lines in numbers" do
      expect { StringCalculator.add("\n,5,6") }.to raise_error(ArgumentError, "Invalid Input")
      expect { StringCalculator.add("5\n,6") }.to raise_error(ArgumentError, "Invalid Input")
      expect { StringCalculator.add("5,6,\n") }.to raise_error(ArgumentError, "Invalid Input")
    end

    it "handles different delimiters" do
      expect(StringCalculator.add("//;\n5;6")).to eq(11)
      expect(StringCalculator.add("//;\n5;6;8")).to eq(19)
      expect(StringCalculator.add("//\n5//6;8")).to eq(19)
    end

    it "handles complex delimiters" do
      expect(StringCalculator.add("//\n5;6;\n8")).to eq(19)
      expect(StringCalculator.add("//&&&\n5&&&6&&&8")).to eq(19)
    end

    it "raises an exception for negative numbers" do
      expect { StringCalculator.add("5,-6,8") }.to raise_error(ArgumentError, "Negatives not allowed: -6")
    end

    it "raises an exception listing all negative numbers" do
      expect { StringCalculator.add("0,-5,6,-8") }.to raise_error(ArgumentError, "Negatives not allowed: -5, -8")
      expect { StringCalculator.add("//;\n-5;6\n-8") }.to raise_error(ArgumentError, "Negatives not allowed: -5, -8")
    end

    it "ignores numbers greater than 1000" do
      expect(StringCalculator.add("5,1001")).to eq(5)
      expect(StringCalculator.add("1000,1002,5")).to eq(1005)
      expect(StringCalculator.add("//;\n5;1111;6")).to eq(11)
    end
  end
end
