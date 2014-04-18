require 'spec_helper'
require 'converters/roman_numeral_converter'

describe 'Roman Numeral Converter' do
  let (:converter) { Converters::RomanNumeralConverter.new }

  describe 'convert_to_digit' do
    context 'Single Roman numbers' do
      it 'should convert I to 1' do
        converter.convert_to_digit('I').should eql 1
      end

      it 'should convert V to 5' do
        converter.convert_to_digit('V').should eql 5
      end

      it 'should convert X to 10' do
        converter.convert_to_digit('X').should eql 10
      end

      it 'should convert L to 50' do
        converter.convert_to_digit('L').should eql 50
      end

      it 'should convert C to 100' do
        converter.convert_to_digit('C').should eql 100
      end

      it 'should convert D to 500' do
        converter.convert_to_digit('D').should eql 500
      end

      it 'should convert M to 1000' do
        converter.convert_to_digit('M').should eql 1000
      end
    end

    context 'Extra roman number on the right' do
      it 'should convert VI to 6' do
        converter.convert_to_digit('VI').should eql 6
      end

      it 'should convert VII to 7' do
        converter.convert_to_digit('VII').should eql 7
      end
    end

    context 'Extra roman number on the left' do
      it 'should convert IV to 4' do
        converter.convert_to_digit('IV').should eql 4
      end
    end

    context 'Now a hard one: MCMLXXXIV' do
      it 'should convert to 1984' do
        converter.convert_to_digit('MCMLXXXIV').should eql 1984
      end
    end
  end

  describe 'convert_to_roman' do
    context 'simple roman numerals' do
      it 'should convert 1 to I' do
        converter.convert_to_roman(1).should eql 'I'
      end

      it 'should convert 5 to V' do
        converter.convert_to_roman(5).should eql 'V'
      end

      it 'should convert 10 to X' do
        converter.convert_to_roman(10).should eql 'X'
      end

      it 'should convert 50 to L' do
        converter.convert_to_roman(50).should eql 'L'
      end

      it 'should convert 100 to C' do
        converter.convert_to_roman(100).should eql 'C'
      end

      it 'should convert 500 to D' do
        converter.convert_to_roman(500).should eql 'D'
      end

      it 'should convert 1000 to M' do
        converter.convert_to_roman(1000).should eql 'M'
      end
    end
  end
end
