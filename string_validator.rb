require 'pry'

class StringValidator

  def initialize
  end

  def validate(data)
    array = data.split("")
    first_half = array[0..(array.length / 2) - 1]
    second_half = array[(array.length / 2)..array.length]

    create_opposites_hash
    
    i = 0

    still_valid = true
    until i >= array.length do 

      the_end = array[(array.length - 1) - i]
      the_start = array[i]

      if alphanumeric?(the_start) || alphanumeric?(the_end)
        still_valid = true
        i += 1
      elsif @checking_hash[the_start] == the_end
        still_valid = true
        i += 1
      elsif @checking_hash[the_start] == array[(i + 1)]
          still_valid = true
          i += 2 
      elsif !( @checking_hash[the_start] == array[(i + 1)] ) || !( @checking_hash[the_start] == the_end )
        still_valid = false
        break
      end

    end

    return still_valid
  end

  def create_opposites_hash
    @checking_hash = Hash.new

    @checking_hash["{"] =  "}" 
    @checking_hash["["] =  "]" 
    @checking_hash["("] =  ")" 

    @checking_hash["}"] =  "{" 
    @checking_hash["]"] =  "[" 
    @checking_hash[")"] =  "(" 
  end

  def alphanumeric?(test_case)
    test_case =~ /[[:alnum]]/
  end

end


      # if @checking_hash[first_half[i]] == second_half[i]
      #   still_valid = true
      # else
      #   still_valid = false
      #   break
      # end

      # i += 1 

    # puts i 
    # puts still_valid

# psuedo
# check if the adjacent value in array[i + 1] is a kissing pair
  # if it is, then return valid 
  # and bump up i to go to the next kissing pair 
# else if 
  # the start not equal to the end && the start or the start +1 not equal 
  # return false 
