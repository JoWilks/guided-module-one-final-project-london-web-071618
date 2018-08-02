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

four_letter_array.each {|array| FourLetter.create(myers_briggs_type: array[1], subtitle: array[2], description: array[3], dominant_function: array[4], auxiliary_function: array[5], tertiary_function: array[6], inferior_function: array[7])}

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

function_analysis_array = []
CSV.foreach("lib/seeds/function_analysis.csv") do |row|
  function_analysis_array << row
end
function_analysis_array.each {|array| FunctionAnalysis.create(symbol: array[0], name: array[1], desc: array[2])}

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

compatibility_array = []
CSV.foreach("lib/seeds/compatibility.csv") do |row|
  compatibility_array << row
end

compatibility_array.each do |array|
  very_compatible_array = []
  pot_compatible_array = []
  least_compatible_array = []
  array.each do |element|
    if element.include?("very compatible")
      elem_shortened = element.slice(0,4)
      very_compatible_array.push(elem_shortened)
    elsif element.include?("potentially compatible")
        elem_shortened = element.slice(0,4)
        pot_compatible_array.push(elem_shortened)
    elsif element.include?("least compatible")
        elem_shortened = element.slice(0,4)
        least_compatible_array.push(elem_shortened)
    end
  end
  very_compatible = very_compatible_array.join(", ")
  pot_compatible = pot_compatible_array.join(", ")
  least_compatible = least_compatible_array.join(", ")

  CompatibilityChart.create(main_type: array[0], very_compatible: very_compatible, potentially_compatible: pot_compatible, least_compatible: least_compatible)
end
