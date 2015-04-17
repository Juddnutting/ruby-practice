
def caesar_cipher(word,shift)
  shifted = []
  word.each_byte do |c| 

    if c.between?(65,90)
      new_char = c + shift
      if new_char > 90
        new_char = (new_char % 90) + 64
      end
    shifted.push(new_char)
    
    elsif c.between?(97,122)
      new_char = c + shift
      if new_char > 122
      new_char = (new_char % 122) + 96
      end
      shifted.push(new_char)
    else
     shifted.push(c)
    end
  end

  shifted_words = ""
  shifted.each do|num|
    shifted_words << num.chr
  end
  return shifted_words
end

#puts caesar_cipher("HI there! ZZZzz", 4)
