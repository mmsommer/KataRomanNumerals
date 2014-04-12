require 'spec_helper'
require 'converters/roman_numeral_converter'

describe 'Roman Numeral Converter' do
  let (:converter) { Converters::RomanNumeralConverter.new }

  it 'should convert 1 to I' do
    converter.convert_to_roman(1).should eql 'I'
  end
end
