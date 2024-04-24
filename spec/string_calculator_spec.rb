require './lib/string_calculator.rb'

describe StringCalculator do 

 before do
    @string_calculator = StringCalculator.new
  end

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(@string_calculator.add("")).to eq(0)
    end

    describe 'when there is one argument' do
      it 'must return this argument' do
        expect(@string_calculator.add("1")).to eq(1)
      end
    end

    describe 'multiple numbers' do
      describe 'when there are two numbers' do
        it 'must add the numbers' do
          expect(@string_calculator.add("1,2")).to eq(3)
        end
      end

      describe 'when the numbers are separated by commas' do
        it 'must add all the numbers' do
          expect(@string_calculator.add("1,2,3,4")).to eq(10)
        end
      end

      describe 'when there are newlines between the numbers' do
        it 'handles new lines between number' do
          expect(@string_calculator.add("1\n2,3")).to eq(6)
        end
      end
    end

    describe 'when there is a delimiter defined' do
      it 'must use the new delimiter' do
        expect(@string_calculator.add("//;\n1;2")).to eq(3)
      end

      it 'must use the ! delimiter' do
        expect(@string_calculator.add("//!\n1!2")).to eq(3)
      end

       it "Multiple delimiters format - //[***][---]\\n1***2---3" do
         expect(@string_calculator.add("//[***][---]\n1***2---3")).to eq(6)
      end

      describe 'with delimiters of longer than 1 char' do
        it 'can parse the delimiter correctly' do
          expect(@string_calculator.add("//[***]\n1***2***3")).to eq(6)
        end

        it 'can parse the delimiter correctly if the delimiter consists of different chars' do
          expect(@string_calculator.add("//[**!]\n1**!2**!3")).to eq(6)
        end
      end
    end

    describe 'when there are negative numbers' do
      it 'raises an error and shows the negative number' do
       expect { @string_calculator.add("1,2,3,-4") }.to raise_error(StandardError, "negative numbers not allowed -4")
     end

     it 'raises an error and shows multiple negative numbers' do
       expect { @string_calculator.add("1,-2,3,-4") }.to raise_error(StandardError, "negative numbers not allowed -2,-4")
     end
   end
  end
  
end
