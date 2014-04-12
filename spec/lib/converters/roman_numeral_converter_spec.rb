require 'spec_helper'
require 'converters/roman_numeral_converter'

describe 'Roman Numeral Converter' do
  let (:converter) { Converters::RomanNumeralConverter.new }

  describe 'convert_to_roman' do
    context 'Single Roman numbers' do
      it 'should convert I to 1' do
        converter.convert_to_roman('I').should eql 1
      end

      it 'should convert V to 5' do
        converter.convert_to_roman('V').should eql 5
      end

      it 'should convert X to 10' do
        converter.convert_to_roman('X').should eql 10
      end

      it 'should convert L to 50' do
        converter.convert_to_roman('L').should eql 50
      end

      it 'should convert C to 100' do
        converter.convert_to_roman('C').should eql 100
      end

      it 'should convert D to 500' do
        converter.convert_to_roman('D').should eql 500
      end

      it 'should convert M to 1000' do
        converter.convert_to_roman('M').should eql 1000
      end
    end

    context 'Extra roman number on the right' do
      it 'should convert VI to 6' do
        converter.convert_to_roman('VI').should eql 6
      end

      it 'should convert VII to 7' do
        converter.convert_to_roman('VII').should eql 7
      end
    end

    context 'Extra roman number on the left' do
      it 'should convert IV to 4' do
        converter.convert_to_roman('IV').should eql 4
      end
    end

    context 'Now a hard one: MCMLXXXIV' do
      it 'should convert to 1984' do
        converter.convert_to_roman('MCMLXXXIV').should eql 1984
      end
    end
  end
end
