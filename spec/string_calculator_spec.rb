require './lib/string_calculator.rb'

describe StringCalculator do 

 before do
    @string_calculator = StringCalculator.new
  end

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(@string_calculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(@string_calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(@string_calculator.add("1,2")).to eq(3)
    end
  end
end
