class Person < ActiveRecord::Base
  # has_many :letters, through: :person_letters

  def get_letter_desc(input_letter)
    #Get description of input letter
    l= Letter.all.select {|letter_instance| letter_instance.letter == input_letter}[0]
    puts "************************************************************************"
    puts ""
    puts "#{l.letter}"
    puts "-------"
    puts "#{l.description}"
    puts ""
  end

  def get_four_letter_instance
   FourLetter.all.select {|fourletter| fourletter.myers_briggs_type == self.four_letter}[0]
   end

   def mbti_overview
     self.get_four_letter_instance.full_description
   end

   def mbti_letters_desc
     self.get_four_letter_instance.each_letters_descriptions
   end

   def select_function_pair
     FunctionPair.all.select {|pair| pair.name == self.four_letter[1]+self.four_letter[2]}[0]
   end

   def function_pair_desc
     self.select_function_pair.info
   end

   def find_ppl_matching_function_pair
     array_names = self.select_function_pair.people.collect {|person| person.name}
     puts ""
     puts "Other people with the same function pair are #{array_names.to_sentence}."
     puts ""
     puts "************************************************************************"
   end

   def select_function_attitude
     FunctionAttitude.all.select {|pair| pair.name == self.four_letter[0]+self.four_letter[1]}[0]
   end

   def function_attitude_desc
     self.select_function_attitude.info
   end

   def find_ppl_matching_function_attitude
    array_names = self.select_function_attitude.people.collect {|person| person.name}
    puts ""
    puts "Other people with the same function attitude are #{array_names.to_sentence}."
    puts ""
    puts "************************************************************************"
   end

  def Person.type_count(mbti)
    Person.all.select {|person| person.four_letter == mbti}.count
  end

  def find_ppl_matching_type
    array_names = Person.all.select {|person| person.four_letter == self.four_letter}.map {|person| person.name}
    array_names -= [self.name]
    puts ""
    puts "Other people with the #{self.four_letter} personality type are #{array_names.to_sentence}."
    puts ""
    puts "************************************************************************"
  end

  def find_ppl_matching_mind
    mind = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].mind_id
    matching_people_id = PersonLetter.all.select {|pl| pl.mind_id == mind}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    array_names -= [self.name]
    letter_match = Letter.all.find {|letter| letter.id == mind}
    puts ""
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
    puts ""
    puts "************************************************************************"
  end

  def find_ppl_matching_energy
    energy = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].energy_id
    matching_people_id = PersonLetter.all.select {|pl| pl.energy_id == energy}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    array_names -= [self.name]
    letter_match = Letter.all.find {|letter| letter.id == energy}
    puts ""
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
    puts ""
    puts "************************************************************************"
  end

  def find_ppl_matching_nature
    nature = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].nature_id
    matching_people_id = PersonLetter.all.select {|pl| pl.nature_id == nature}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    array_names -= [self.name]
    letter_match = Letter.all.find {|letter| letter.id == nature}
    puts ""
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
    puts ""
    puts "************************************************************************"
  end

  def find_ppl_matching_tactics
    tactics = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].tactics_id
    matching_people_id = PersonLetter.all.select {|pl| pl.tactics_id == tactics}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    array_names -= [self.name]
    letter_match = Letter.all.find {|letter| letter.id == tactics}
    puts ""
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
    puts ""
    puts "************************************************************************"
  end

  def get_dominant_function
    mbti_name = self.four_letter
    dom_func_letters = FourLetter.all.find{|type| type.myers_briggs_type == mbti_name}.dominant_function
    analysis = FunctionAnalysis.all.find{|type| type.symbol == dom_func_letters}
    puts "************************************************************************"
    puts ""
    puts "#{analysis.name}"
    puts "-------"
    puts "Your dominant function is #{analysis.name}, which is your primary way of perceiving and judging. Someone with Dominant #{analysis.symbol} #{analysis.desc.downcase}"
    puts ""
  end

  def get_auxiliary_function
    mbti_name = self.four_letter
    dom_func_letters = FourLetter.all.find{|type| type.myers_briggs_type == mbti_name}.auxiliary_function
    analysis = FunctionAnalysis.all.find{|type| type.symbol == dom_func_letters}
    puts "************************************************************************"
    puts ""
    puts "#{analysis.name}"
    puts "-------"
    puts "Your auxiliary function is #{analysis.name}, which is your second most prominent way of perceiving and judging. Someone with Auxiliary #{analysis.symbol} tends to #{analysis.desc.downcase}"
    puts ""

  end

def get_tertiary_function
  mbti_name = self.four_letter
  ter_func_letters = FourLetter.all.find{|type| type.myers_briggs_type == mbti_name}.tertiary_function
  analysis = FunctionAnalysis.all.find{|type| type.symbol == ter_func_letters}
  puts "************************************************************************"
  puts ""
  puts "#{analysis.name}"
  puts "-------"
  puts "Your tertiary function is #{analysis.name}, which is one of the ways that you perceive and judge. Someone with Tertiary #{analysis.symbol}, to a degree #{analysis.desc.downcase}"
  puts ""
end

def get_inferior_function
  mbti_name = self.four_letter
  inf_func_letters = FourLetter.all.find{|type| type.myers_briggs_type == mbti_name}.inferior_function
  analysis = FunctionAnalysis.all.find{|type| type.symbol == inf_func_letters}
  puts "************************************************************************"
  puts ""
  puts "#{analysis.name}"
  puts "-------"
  puts "Your inferior function is #{analysis.name}, which is a less obvious way that you perceive and judge. Someone with inferior #{analysis.symbol} in some ways #{analysis.desc.downcase}"
  puts ""
end

end
