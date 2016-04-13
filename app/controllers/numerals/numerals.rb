class Numerals
  def initialize
    @result = ""
  end

  def number_words(num)
  # preffixes used in the tenths
  preffix = ["","","twen", "thir", "for", "fif"]
  # An array with the numbers from 1 to 19
  first_numbers = ["", "one", "two", "three", "four", "five", "six",
                   "seven", "eight", "nine", "ten", "eleven", "twelve",
                   "thirtenen", "fourteen", "fifteen", "sixteen",
                    "seventeen", "eighteen", "nineteen"]
  suffix = ["ty", "hundred", "thousand,", "million"]
    if num >= 0
      case num
        when 0..9
          # keeps the former value of result in case the method is called with
          # a bigger number
          @result = "#{@result}#{first_numbers[num]}"
        when 10..19
          @result = "#{@result}#{first_numbers[num]}"
        when 20..99
          tens = num/10
          num = num % 10
          if tens == 8
            # drops the 't' from eight, so it doesnt repeat with suffix[0]
            @result = "#{@result}#{first_numbers[tens].chomp('t')}"
          else
            # this calculates the correct way to express the tens
            @result = tens < 6? "#{@result}#{preffix[tens]}" : "#{@result}#{first_numbers[tens]}"
          end
          # adds the 'ty' and decides if there is another unit to be displayed
          @result = "#{@result}#{suffix[0]}"
          @result = num > 0? "#{@result}-#{first_numbers[num]}": "#{@result}"
        when 99..999
          digit = num/100
          num = (num%100)
          @result = "#{@result}#{first_numbers[digit]}#{suffix[1]} "
          number_words(num)
        when 1000..999999999
          #takes all the numbers except last three (thousands)
          digit = num.to_s.chars.first(num.to_s.length - 3).join.to_i
          #Takes last 3 numbers (hundreds)
          num = num.to_s.split('').drop(num.to_s.length - 3).join.to_i
          if digit.between?(19, 999)
            #Calculates the name of the first digits (thousands)
            number_words(digit)
          elsif digit.between?(1000, 9999999)
            millions = digit/1000
            # drop last three digits and calculate value recursively
            digit = digit.to_s.split('').drop(digit.to_s.length - 3).join.to_i
            @result = "#{@result} #{first_numbers[millions]} #{suffix[3]} "
            number_words(digit)
          end
          if digit > 0
            @result = "#{@result} #{first_numbers[digit]} #{suffix[2]} "
            number_words(num)
          end
        else
          @result = "Please pick a smaller number..."
      end
    end
  end
end

