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
      return ROMAN.key(digit) if ROMAN.value? digit
      rest = digit
      result = ''
      while rest > 0
        best_fit = best_fit_roman_numeral(rest)
        the_one_after = roman_numeral_after(best_fit)
        if !the_one_after.nil?
          temp_rest = rest + ROMAN[best_fit]
          best_fit = best_fit + the_one_after if best_fit_roman_numeral(temp_rest) == the_one_after
        end
        result += best_fit
        rest -= convert_to_digit(best_fit)
      end
      result
    end

    def best_fit_roman_numeral(digit)
      ROMAN.values.reverse.map do |value|
        if digit / value >= 1
          ROMAN.key(value)
        end
      end.select { |value| !value.nil?}.first
    end

    private

    def index_of(roman)
      ROMAN.values.index(ROMAN[roman])
    end

    def is_last?(roman)
      ROMAN[roman] != ROMAN.values.last
    end

    def roman_numeral_after(roman)
      is_last?(roman) ? ROMAN.key(ROMAN.values[index_of(roman) + 1]) : nil
    end

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