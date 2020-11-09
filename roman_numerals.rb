class Integer
  CONVERSION_HASH = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def to_roman
    to_roman_helper(roman_num = '', integer = self)
  end

  def to_roman_helper(roman_num, integer)
    return roman_num if integer.zero? || integer.nil?

    CONVERSION_HASH.each do |key, value|
      next unless (integer / key).positive? # next unless is instead of if, suggested by rubocop..
      roman_num << value
      integer -= key
      return to_roman_helper(roman_num, integer)
    end
  end
end
