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
  end
end
