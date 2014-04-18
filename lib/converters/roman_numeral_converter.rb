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
        one_larger = roman_numeral_larger_than(best_fit)
        one_lower = roman_numeral_less_than(best_fit)
        if !one_lower.nil? && [1,10,100].include?(ROMAN[one_lower])
          temp_rest = rest + ROMAN[one_lower]
          best_fit = one_lower + one_larger if best_fit_roman_numeral(temp_rest) == one_larger
        end
        if !one_larger.nil? && [5,50,500].include?(ROMAN[one_larger])
          temp_rest = rest + ROMAN[best_fit]
          best_fit = best_fit + one_larger if best_fit_roman_numeral(temp_rest) == one_larger
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

    def is_first?(roman)
      ROMAN[roman] != ROMAN.values.first
    end

    def roman_numeral_larger_than(roman)
      is_last?(roman) ? ROMAN.key(ROMAN.values[index_of(roman) + 1]) : nil
    end

    def roman_numeral_less_than(roman)
      is_first?(roman) ? ROMAN.key(ROMAN.values[index_of(roman) - 1]) : nil
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