class FourLetter < ActiveRecord::Base
  def people
   #Return array of instances of all the people with the specified myers_briggs_type
     Person.all.select {|person| person.four_letter_type == self.myers_briggs_type}
   end

   def full_description
     #description of the full mbti type.
     puts "************************************************************************"
     puts ""
     puts "#{self.myers_briggs_type}: #{self.subtitle}"
     puts "-------------------------------------------"
     puts "#{self.description}"
     puts ""
   end

   def each_letters_descriptions
   #returns array of all descriptions of each letter in selected myers_briggs_type
     array_single_letters = self.myers_briggs_type.split(//)
     output_array = []
     Letter.all.each{|letter_instance|
       array_single_letters.each {|letter|
         if letter_instance.letter == letter
           output_array << letter_instance
         end}}

     output_array.each{|letter_instance|
       puts "************************************************************************"
       puts ""
       puts "#{letter_instance.letter}"
       puts "----------------------------"
       puts "#{letter_instance.description}"
       puts ""}
   end
end
