def welcome
  puts "************************************************************************"
  puts ""
  puts "Welcome to the MBTI Analysis generator. Based on the Myers-Briggs Type Indicator, we seek to give you a more in-depth analysis of your personality type."
  puts "-----------------------------"
end

def get_name_from_user
  puts "Please enter your full name."
  puts "-----------------------------"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end

def get_mbti_from_user
  puts "-------------------------------------------------------"
  puts ""
  puts "Please enter your MBTI result in four capital letters."
  puts ""
  puts "If you don't know your MBTI result, take the test at https://www.16personalities.com/free-personality-test."
  puts "-------------------------------------------------------"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end

def name_exists(instance)
    puts "----------------------------------------------------------------------------"
    puts "Your name '#{instance.name}' is already in the database, are you the MBTI type #{instance.four_letter}?"
    puts "Type 'yes', if this is correct or 'no' if you would like to update your MBTI"
    puts "----------------------------------------------------------------------------"
    user_input = gets.chomp
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
  puts "************************************************************************"
  puts ""
  puts "Hi, #{name}. We have recorded #{same_count} individuals with the #{mbti} type in our database."
end

def press_return_menu
  # function that pauses after getting information from the ask_for_info options, and makes user press key to return back to press_return_menu
  puts "press enter to return to the main menu"
  press_something = gets.chomp
end

def slow_down
  #function that makes pauses before loading info, just to give users eyes a bit of time to track what's happening on the command line
  array_animate = ["L","O","A","D","I","N","G",".",".","."] #["I", "E","S", "N","T", "F","P","J"]
  puts ""
  array_animate.each{|element|
    printf element
    sleep(0.1)}
    puts ""
end

def ask_for_info(mbti)
  split_letters = mbti.split(//)
  puts ""
  puts "What would you like to know?"
  puts "----------------------------------------------------------------------------"
  puts "Enter one of the following choices:"
  puts "'my type'                     --for your full MBTI type analysis, & other people who share the same type in our database."
  puts "'#{split_letters[0]}', '#{split_letters[1]}', '#{split_letters[2]}' or '#{split_letters[3]}'          --to learn more about that trait, & see who else shares the same letter in our database."
  puts "'dominant'                    --to learn about your dominant cognitive function."
  puts "'auxiliary'                   --to learn about your auxiliary cognitive function."
  puts "'tertiary' or 'inferior'      --to find out about those cognitive functions."
  puts "'function attitude'           --to learn about your function attitude."
  puts "'function pair'               --to learn about your function pair."
  puts "'exit'                        --to exit the program."
  puts "----------------------------------------------------------------------------"
  gets.chomp
end


def give_info(name, mbti)
  greeting(name, mbti)
  loop do
    mbti_array = mbti.split("")
    preference = ask_for_info(mbti)
      if preference == "my type"
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.mbti_overview
        obj.find_ppl_matching_type
        press_return_menu
      elsif preference == mbti_array[0]
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_mind
        press_return_menu
      elsif preference == mbti_array[1]
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_energy
        press_return_menu
      elsif preference == mbti_array[2]
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_nature
        press_return_menu
      elsif preference == mbti_array[3]
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(preference)
        obj.find_ppl_matching_tactics
        press_return_menu
      elsif preference == "dominant"
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_dominant_function
        press_return_menu
      elsif preference == "auxiliary"
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_auxiliary_function
        press_return_menu
      elsif preference == "tertiary"
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_tertiary_function
        press_return_menu
      elsif preference == "inferior"
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_inferior_function
        press_return_menu
      elsif preference == "function pair"
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.function_pair_desc
        obj.find_ppl_matching_function_pair
        press_return_menu
      elsif preference == "function attitude"
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.function_attitude_desc
        obj.find_ppl_matching_function_attitude
        press_return_menu
      elsif preference == "exit"
        break
      else
        puts "******Input not recognized******"
    end
  end
end
