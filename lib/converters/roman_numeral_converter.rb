module Converters
  class RomanNumeralConverter
    def convert_to_digit(roman)
      roman = roman.chars.to_a

      case
        when roman.empty?
          0
        when roman.size == 1
          ROMAN[roman.shift]
        when ROMAN[roman[0]] < ROMAN[roman[1]]
          -ROMAN[roman.shift] + convert_to_digit(roman.join)
        else
          ROMAN[roman.shift] + convert_to_digit(roman.join)
      end
    end

    def convert_to_roman(digit)
      ROMAN.key(digit)
    end

    private

    ROMAN = {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100,
      'D' => 500,
      'M' => 1000
    }
  end
end