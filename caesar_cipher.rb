
def caesar_cipher(word,shift)
  shifted = ""
  shift %= 26 
  
  word.each_byte do |c| 
      if c.between?(65,90)
      new_char = c + shift
      if new_char > 90
        new_char = (new_char % 90) + 64
      end
    shifted += new_char.chr    
    elsif c.between?(97,122)
      new_char = c + shift
      if new_char > 122
      new_char = (new_char % 122) + 96
      end
      shifted += new_char.chr
    else
     shifted += c.chr
    end
  end
  return shifted
end

#puts caesar_cipher("AZ", 100)
