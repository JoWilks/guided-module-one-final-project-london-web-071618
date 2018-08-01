class Person < ActiveRecord::Base
  has_many :letters, through: :person_letters

  def get_letter_desc(input_letter)
    #Get description of input letter
    l= Letter.all.select {|letter_instance| letter_instance.letter == input_letter}[0]
    puts "#{l.letter}: #{l.description}"
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

  def Person.type_count(mbti)
    Person.all.select {|person| person.four_letter == mbti}.count
  end


  def find_ppl_matching_type
    array_names = Person.all.select {|person| person.four_letter == self.four_letter}.map {|person| person.name}
    array_names -= [self.name]
    puts "Other people with the #{self.four_letter} personality type are #{array_names.to_sentence}."
  end

  def find_ppl_matching_mind
    mind = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].mind_id
    matching_people_id = PersonLetter.all.select {|pl| pl.mind_id == mind}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    letter_match = Letter.all.find {|letter| letter.id == mind}
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
  end

  def find_ppl_matching_energy
    energy = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].energy_id
    matching_people_id = PersonLetter.all.select {|pl| pl.energy_id == energy}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    letter_match = Letter.all.find {|letter| letter.id == energy}
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
  end

  def find_ppl_matching_nature
    nature = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].nature_id
    matching_people_id = PersonLetter.all.select {|pl| pl.nature_id == nature}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    letter_match = Letter.all.find {|letter| letter.id == nature}
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
  end

  def find_ppl_matching_tactics
    tactics = PersonLetter.all.select {|pl| pl.person_id == self.id}[0].tactics_id
    matching_people_id = PersonLetter.all.select {|pl| pl.tactics_id == tactics}.map {|person| person.id}
    array_names = Person.all.select{|person| matching_people_id.include?(person.id)}.map {|person| person.name}
    letter_match = Letter.all.find {|letter| letter.id == tactics}
    puts "Other people with the #{letter_match.letter} mind type are #{array_names.to_sentence}."
  end
end
