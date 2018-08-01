require 'csv'

Letter.delete_all
FourLetter.delete_all
Person.delete_all
# PersonLetter.delete_all
#add csv files from Lib/seeds dir into development database as instances ***MUST CALL: rake db:migrate in order for it to be added***

#add letters csv into development database
letter_array = []

CSV.foreach("lib/seeds/letters.csv") do |row|
  letter_array << row
end

letter_array.each {|array| Letter.create(letter: array[1], description: array[2]) }

#add four_letter csv into development database
four_letter_array = []

CSV.foreach("lib/seeds/four_letters.csv") do |row|
  four_letter_array << row
end

four_letter_array.each {|array| FourLetter.create(myers_briggs_type: array[1], subtitle: array[2], description: array[3])}

#add people csv into development database
 people_array= []

CSV.foreach("lib/seeds/people.csv") do |row|
  people_array << row
end

people_array.each {|array| Person.create(name: array[0], four_letter: "#{array[1]}#{array[2]}#{array[3]}#{array[4]}")}
