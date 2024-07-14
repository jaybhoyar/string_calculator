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

  end
end
