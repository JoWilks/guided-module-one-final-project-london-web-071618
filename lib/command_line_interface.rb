def welcome
  puts "Welcome to the MBTI Analysis generator. Based on the Myers-Briggs Type Indicator, we seek to give you a more in-depth analysis of your personality type."
end

def get_name_from_user
  puts "Please enter your full name."
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end

def get_mbti_from_user
  puts "Please enter your MBTI result in four capital letters. \n
  If you don't know your MBTI result, take the test at https://www.16personalities.com/free-personality-test."
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end

def save_user(name, mbti)
  new_person = Person.create(name:name, four_letter:mbti)
  mbti_array = mbti.split("")
  mind_letter = Letter.all.find {|letter| letter.letter == mbti_array[0]}.id
  energy_letter = Letter.all.find {|letter| letter.letter == mbti_array[1]}.id
  nature_letter = Letter.all.find {|letter| letter.letter == mbti_array[2]}.id
  tactics_letter =  Letter.all.find {|letter| letter.letter == mbti_array[3]}.id
  four_letter = FourLetter.all.find{|letter| letter.myers_briggs_type == mbti}.id
  PersonLetter.create(person_id:new_person.id, mind_id:mind_letter, energy_id:energy_letter, nature_id:nature_letter, tactics_id:tactics_letter , four_letter_id:four_letter)
end

def greeting(name, mbti)
  same_count = Person.type_count(mbti)
  puts "Hi, #{name}. We have recorded #{same_count} individuals with the #{mbti} type in our database."
end

def ask_for_info
  puts "What would you like to know?"
  puts "Enter one of the following choices:"
  puts "- Enter 'my type' for your full MBTI type analysis, and a list of people in our database who share the same type.\n
  - One of the letters from your MBTI type, to learn more about that trait, and see who else shares it in our database.\n
  - Enter 'dominant' to learn about your dominant cognitive function, 'auxiliary' to learn about your auxiliary cognitive function, or 'tertiary' or 'inferior' to find out about those cognitive functions.\n
  - Type 'function attitude' to learn about your function attitude, and 'function pair' to learn about your function pair.\n
  \n Type 'exit' to exit the program."
  gets.chomp
end
#add info about how to check out function pair or function attitude

def give_info(name, mbti)
  greeting(name, mbti)
  loop do
    mbti_array = mbti.split("")
    preference = ask_for_info
      if preference == "my type"
        obj = Person.all.find {|person| person.name == name}
        obj.mbti_overview
        obj.find_ppl_matching_type
      elsif preference == mbti_array[0]
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_mind
      elsif preference == mbti_array[1]
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_energy
      elsif preference == mbti_array[2]
      obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_nature
      elsif preference == mbti_array[3]
      obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_tactics
      elsif preference == "dominant"
        obj = Person.all.find {|person| person.name == name}
        obj.get_dominant_function
      elsif preference == "auxiliary"
        obj = Person.all.find {|person| person.name == name}
        obj.get_auxiliary_function
      elsif preference == "tertiary"
        obj = Person.all.find {|person| person.name == name}
        obj.get_tertiary_function
      elsif preference == "inferior"
        obj = Person.all.find {|person| person.name == name}
        obj.get_inferior_function
      elsif preference == "function pair"
        obj = Person.all.find {|person| person.name == name}
        obj.function_pair_desc
      elsif preference == "function attitude"
        obj = Person.all.find {|person| person.name == name}
        obj.function_attitude_desc
      elsif preference == "exit"
        break
      else
        "Input not recognized."
    end
  end
end
