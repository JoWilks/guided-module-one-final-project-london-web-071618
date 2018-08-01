require 'csv'

Letter.delete_all
FourLetter.delete_all
Person.delete_all
PersonLetter.delete_all
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

people_array.each {|array| Person.create(name: array[1], four_letter: array[2])}

#add joiner table data from person_lettesr.csv into development database
 person_letters_array= []

CSV.foreach("lib/seeds/person_letters.csv") do |row|
  person_letters_array << row
end

person_letters_array.each {|array| PersonLetter.create(person_id: array[0], mind_id: array[1], energy_id: array[2], nature_id: array[3], tactics_id: array[4], four_letter_id: array[5])}

#add function pairs table data from function_pairs.csv into development database
 function_pairs_array= []

CSV.foreach("lib/seeds/function_pairs.csv") do |row|
  function_pairs_array << row
end

function_pairs_array.each {|array| FunctionPair.create(name: array[0], title: array[1], description: array[2])}

#add function attitudes table data from function_attitudes.csv into development database
 function_attitudes_array= []

CSV.foreach("lib/seeds/function_attitudes.csv") do |row|
  function_attitudes_array << row
end

function_attitudes_array.each {|array| FunctionAttitude.create(name: array[0], title: array[1], description: array[2])}
