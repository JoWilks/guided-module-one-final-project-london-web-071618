class Person < ActiveRecord::Base
  # has_many :letters, through: :person_letters

  #basic functions
  def dom_func_letters  #get letters of dominant function
    FourLetter.all.find{|type| type.myers_briggs_type == self.four_letter}.dominant_function
  end

  def aux_func_letters #get letters of auxiliary function
    FourLetter.all.find{|type| type.myers_briggs_type == self.four_letter}.auxiliary_function
  end

  def get_letter_desc(input_letter) #Get description of input letter
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

   def find_ppl_matching_function_pair #find all people in database with same function pair
     array_names = self.select_function_pair.people.collect {|person| person.name}
     array_names -= [self.name]
     puts ""
     puts "Other people with the same function pair are #{array_names.to_sentence}."
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
    puts ""
    puts "#{analysis.name}"
    puts "----------------------------"
    puts "Your dominant function is #{analysis.name} - your most developed/sophisticated cognitive function. #{analysis.desc}"
    puts ""
    return dom_func_letters
  end

  def get_auxiliary_function
    mbti_name = self.four_letter
    aux_func_letters = FourLetter.all.find{|type| type.myers_briggs_type == mbti_name}.auxiliary_function
    analysis = FunctionAnalysis.all.find{|type| type.symbol == aux_func_letters}
    puts ""
    puts "#{analysis.name}"
    puts "----------------------------"
    puts "Your auxiliary function is #{analysis.name}, which is your second most developed cognitive function, which balances out your Dominant Function. Unlike the dominant function, it comes less instinctively to you but you are very aware of it, and skilled with it."
    puts "#{analysis.desc}"
    puts ""
    return aux_func_letters
  end

  def get_tertiary_function
    mbti_name = self.four_letter
    ter_func_letters = FourLetter.all.find{|type| type.myers_briggs_type == mbti_name}.tertiary_function
    analysis = FunctionAnalysis.all.find{|type| type.symbol == ter_func_letters}
    puts ""
    puts "#{analysis.name}"
    puts "----------------------------"
    puts "Your tertiary function is #{analysis.name}. It is less accessible to you, and you may not fully develop it until you reach mature adulthood. When you're younger, this might be a function you call upon when you are under stress."
    puts "#{analysis.desc}"
    puts ""
  end

def get_inferior_function
  mbti_name = self.four_letter
  inf_func_letters = FourLetter.all.find{|type| type.myers_briggs_type == mbti_name}.inferior_function
  analysis = FunctionAnalysis.all.find{|type| type.symbol == inf_func_letters}
  puts ""
  puts "#{analysis.name}"
  puts "----------------------------"
  puts "Your inferior function is #{analysis.name}, which is a less obvious way that you perceive and judge. Someone with inferior #{analysis.symbol} in some ways #{analysis.desc.downcase}"
  puts ""
end

  def get_compatibility(name)
    my_mbti_name = self.four_letter
    my_chart = CompatibilityChart.find_my_compatibility(my_mbti_name)
    their_type = Person.find_by(name:name).four_letter
    if my_chart.very_compatible.include?(their_type)
      puts "According to your MBTI compatibility chart, based on both studies and data, as a #{my_mbti_name} you are very compatible with #{name}, who is a #{their_type}."
    elsif my_chart.potentially_compatible.include?(their_type)
      puts "According to your MBTI compatibility chart, based on both studies and data, as a #{my_mbti_name} you are potentially compatible with #{name}, who is a #{their_type}."
    elsif my_chart.least_compatible.include?(their_type)
      puts "According to your MBTI compatibility chart, based on both studies and data, as a #{my_mbti_name} you are not as compatible with #{name}, who is a #{their_type}."
    end
    if self.get_similar_ppl.include?(name)
      puts "You would be considered compatible with #{name} on the basis of similarity, as you share a dominant function, giving you a similar core way of engaging with the world."
    elsif self.get_complementary_ppl.include?(name)
      puts "You would be considered compatible with #{name} on the basis of being complementary, as they might balance you your auxiliary function. According to some compatibility studies, real balance in a relationship occurs when we are able to use and develop our secondary function well enough. "
    end
  end

  def get_compatible_ppl
    my_mbti_name = self.four_letter
    my_chart = CompatibilityChart.find_my_compatibility(my_mbti_name)
    my_chart_very = CompatibilityChart.find_my_compatibility(my_mbti_name).very_compatible.split(", ")
    my_chart_possible = CompatibilityChart.find_my_compatibility(my_mbti_name).potentially_compatible.split(", ")
    my_chart_least = CompatibilityChart.find_my_compatibility(my_mbti_name).least_compatible.split(", ")
    very_compat_people = Person.all.select {|person| my_chart_very.include?(person.four_letter)}.map {|person| person.name} - [self.name]
    poss_compat_people = Person.all.select {|person| my_chart_possible.include?(person.four_letter)}.map {|person| person.name} - [self.name]
    least_compat_people = Person.all.select {|person| my_chart_least.include?(person.four_letter)}.map {|person| person.name} - [self.name]
    puts "--------------------------------------------"
    puts ""
    puts "As a #{my_mbti_name}, according to your compatibility chart, which is based on both studies and collected data, you are most compatible with #{my_chart_very.to_sentence}. This includes people such as #{very_compat_people.to_sentence}."
    puts ""
    puts "You are possibly compatible with #{my_chart_possible.to_sentence}. This includes people such as #{poss_compat_people.to_sentence}."
    puts ""
    puts "You are least compatible with #{my_chart_least.to_sentence}. This includes people such as #{least_compat_people.to_sentence}."
    puts ""
  end

def get_compatible_ppl
  my_mbti_name = self.four_letter
  my_chart = CompatibilityChart.find_my_compatibility(my_mbti_name)
  my_chart_very = CompatibilityChart.find_my_compatibility(my_mbti_name).very_compatible.split(", ")
  my_chart_possible = CompatibilityChart.find_my_compatibility(my_mbti_name).potentially_compatible.split(", ")
  my_chart_least = CompatibilityChart.find_my_compatibility(my_mbti_name).least_compatible.split(", ")
  very_compat_people = Person.all.select {|person| my_chart_very.include?(person.four_letter)}.map {|person| person.name}
  poss_compat_people = Person.all.select {|person| my_chart_possible.include?(person.four_letter)}.map {|person| person.name}
  least_compat_people = Person.all.select {|person| my_chart_least.include?(person.four_letter)}.map {|person| person.name}
  puts "--------------------------------------------"
  puts ""
  puts "As a #{my_mbti_name}, according to your compatibility chart, you are most compatible with #{my_chart_very.to_sentence}. This includes people such as #{very_compat_people.to_sentence}."
  puts "You are possibly compatible with #{my_chart_possible.to_sentence}. This includes people such as #{poss_compat_people.to_sentence}."
  puts "You are least compatible with #{my_chart_least.to_sentence}. This includes people such as #{least_compat_people.to_sentence}."
  puts ""
end

  def get_similar_ppl
    compat_people = []
    dom_func_letters = self.dom_func_letters
    compat_types = FourLetter.all.select {|type| type.dominant_function == dom_func_letters}
    compat_type_letters = compat_types.map {|type| type.myers_briggs_type}
    compat_type_letters.each do |type_letters|
      compat_people << Person.all.select {|person| person.four_letter == type_letters}
    end
    compat_people_names = compat_people.flatten.map {|person| person.name} - [self.name]
    return compat_people_names
  end

  def get_compatibility_by_similarity
    dom_func_letters = self.get_dominant_function
    compat_types = FourLetter.all.select {|type| type.dominant_function == dom_func_letters}
    compat_type_letters = compat_types.map {|type| type.myers_briggs_type}
    compat_people_names = self.get_similar_ppl
    puts "************************************************************************"
    puts ""
    puts "Based on compatibility through a shared dominant function, which gives you a similar main way of perceiving and judging your environment, you would be most compatible with #{compat_type_letters.to_sentence}, such as #{compat_people_names.to_sentence}."
    puts ""
  end

  def get_complementary_ppl
    compat_people = []
    aux_func_letters = self.aux_func_letters
    compat_types = FourLetter.all.select {|type| type.dominant_function == aux_func_letters}
    compat_type_letters = compat_types.map {|type| type.myers_briggs_type}
    compat_type_letters.each do |type_letters|
      compat_people << Person.all.select {|person| person.four_letter == type_letters}
    end
    compat_people_names = compat_people.flatten.map {|person| person.name} - [self.name]
    return compat_people_names
  end


  def get_compatibility_by_complementary
    aux_func_letters = self.get_auxiliary_function
    compat_types = FourLetter.all.select {|type| type.dominant_function == aux_func_letters}
    compat_type_letters = compat_types.map {|type| type.myers_briggs_type}
    compat_people_names = self.get_complementary_ppl
    puts "************************************************************************"
    puts ""
    puts "According to some compatibility studies, real balance in a relationship occurs when we are able to use and develop our secondary function well enough. It challenges us out of our inner subjective worlds (for introverts), or perception of our outer subjective environment (for extroverts). The types who would help to balance your personality out and develop your auxiliary function would be #{compat_type_letters.to_sentence}, such as #{compat_people_names.to_sentence}."
    puts ""
  end

end
