
class Bottles
    def verse(num)
    	next_num = num -1
     	"#{bottles_left(num).capitalize} bottle#{plural_ending(num)} of beer on the wall, #{bottles_left(num)} bottle#{plural_ending(num)} of beer.\n#{bottles_verse_ending(num)}, #{bottles_left(next_num)} bottle#{plural_ending(next_num)} of beer on the wall.\n"
    end

   def bottles_verse_ending(num)
   	if num >= 1
   		"Take #{prenoun(num)} down and pass it around"
   	else
   		"Go to the store and buy some more"
   	end
   end

    def prenoun(num)
    	num == 1 ? "it" : "one"
    end

    def bottles_left(num)
    	if num > 0
    		num.to_s
    	elsif num == 0
    		'no more'
    	else
    		'99'
    	end
    end

    def plural_ending(number)
		number != 1 ? "s" : ""
 	end

  def verses(num, num2)
    result = ""
    num.downto(num2).each do |v|
      result += self.verse(v) + "\n"
    end
    result
  end

  def sing
    verses(99,0)
  end
end




# class Bottles

# 	def verse(verse_number)
# 		bottle_verse(verse_number)
# 	end

# 	def bottle_verse(bottle_number)
# 		"#{bottle_number} bottle#{plural_ending(bottle_number)} of beer on the wall, #{bottle_number} bottle#{plural_ending(bottle_number)} of beer.\n#{bottle_verse_ending(bottle_number)}"
# 	end

# 	def plural_ending(number)
# 		number > 1 ? "s" : ""
# 	end

# 	def bottle_verse_ending(bottle_number)
# 		if bottle_number > 1
# 			"Take one down and pass it around, #{bottle_number-1} bottle#{plural_ending(bottle_number -1)} of beer on the wall.\n"
# 		else
# 			"Take it down and pass it around, no more bottles of beer on the wall.\n"
# 		end
# 	end
# end