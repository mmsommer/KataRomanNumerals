require 'spec_helper'
require 'converters/roman_numeral_converter'

describe 'Roman Numeral Converter' do
  let (:converter) { Converters::RomanNumeralConverter.new }

  it 'should convert 1 to I' do
    converter.convert_to_roman(1).should eql 'I'
  end

  it 'should convert 5 to V' do
    converter.convert_to_roman(5).should eql 'V'
  end

  it 'should convert 10 to X' do
    converter.convert_to_roman(10).should eql 'X'
  end
end
