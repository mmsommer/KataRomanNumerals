require 'spec_helper'
require 'converters/roman_numeral_converter'

describe 'Roman Numeral Converter' do
  let (:converter) { Converters::RomanNumeralConverter.new }

  context 'Default numbers' do
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
