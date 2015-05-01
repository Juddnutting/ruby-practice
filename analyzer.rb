
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join

puts "#{line_count} lines"

total_chrs = text.length
puts "#{total_chrs} characters"

total_chrs_nospaces = text.gsub(/\s+/, '').length
puts "#{total_chrs_nospaces} characters excluding spaces"

word_count = text.split.length
puts "#{word_count} words"

sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
