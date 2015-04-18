def substrings(message, dictionary)
  
  results = {}
  new_message = message.downcase
  dictionary.each do |word|
    value_exists = new_message.scan(word).length 
    results[word] = value_exists if value_exists    
  end
  results
end


a = "Hi buddy, what's up dude. This is a test. Testing Testing one, two, three"
b = ["hi", "test", "what","i", "in", "is"]
puts substrings(a,b)