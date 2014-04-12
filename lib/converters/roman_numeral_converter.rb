module Converters
  class RomanNumeralConverter
    def convert_to_roman(number)
      defaults[number]
    end

    private

    def defaults
      {
          1 => 'I',
          5 => 'V',
          10 => 'X'
      }
    end
  end
end