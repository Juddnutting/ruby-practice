require 'csv'
require 'sunlight/congress'
require 'erb'

puts "Event manager initialized"

def clean_zipcode(zip)
  zip.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zip)
  Sunlight::Congress::Legislator.by_zipcode(zip)
end

def save_thankyou_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")
  filename = "output/thanks_#{id}.html"
  
  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_up_phone_number(number)
  number = number.gsub(/\D/, '')
  if number.length == 10
    return number
  elsif number.length == 11
    return number[1..-1] if number[0].to_i == 1
  end
  return "Phone Number Invalid"
end
    

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone = clean_up_phone_number(row[:homephone])

  #legislators = legislators_by_zipcode(zipcode)
  #form_letter =  erb_template.result(binding)
  #save_thankyou_letters(id, form_letter)
 
  puts "#{name} #{phone}"
  end
