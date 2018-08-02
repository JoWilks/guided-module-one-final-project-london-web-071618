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
  array_animate = ["L","O","A","D","I","N","G",".",".","."]
  puts ""
  array_animate.each{|element|
    printf element
    sleep(0.1)}
    puts ""
end

def ask_for_info(name, mbti)
  split_letters = mbti.split(//)
  puts ""
  puts "What would you like to know?"
  puts "----------------------------------------------------------------------------"
  puts "Enter one of the following numbers:"
  puts "1       --for your full MBTI type analysis."
  puts "2       --for information about what '#{split_letters[0]}' stands for in your MBTI type."
  puts "3       --for information about what '#{split_letters[1]}' stands for in your MBTI type."
  puts "4       --for information about what '#{split_letters[2]}' stands for in your MBTI type."
  puts "5       --for information about what '#{split_letters[3]}' stands for in your MBTI type."
  puts "6       --to learn about your dominant cognitive function."
  puts "7       --to learn about your auxiliary cognitive function."
  puts "8       --to find out about yout tertiary cognitive functions."
  puts "9       --to find out about yout inferior cognitive functions."
  puts "10      --to learn about your function pair."
  puts "11      --to be changed........"
  puts "12      --to change your MBTI type if #{mbti} isn't your correct MBTI type"
  puts "13      --to correct your name if #{name} isn't correct"
  puts "'exit'  --to exit the program."
  puts "----------------------------------------------------------------------------"
  gets.chomp
end

def intro_dominant_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Dominant Function"
  puts "----------------------------------------------------------------------------"
  puts "The dominant function is the combination of 2 functions (i.e for ENFJ a function is one of the letters like the E-extroveted or N-Intuitive) that dominates your personality, and how you make decisions, interact with and percieve the world."
  puts ""
end

def intro_auxiliary_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Auxiliary Function"
  puts "----------------------------------------------------------------------------"
  puts "The Auxiliary function is a combination of 2 functions (i.e for ENFJ a function is one of the letters like the E-extroveted or N-Intuitive) that is opposite to your dominant functions and helps balance it out."
  puts ""
end

def intro_tertiary_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Tertiary Functions"
  puts "----------------------------------------------------------------------------"
  puts "The Tertiary function is the opposite function of your auxiliary, and is something people tend to develop later in life after they feel comfortable and confident with their current Dominant and Auxiliary functions."
  puts ""
end

def intro_inferior_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Inferior Functions"
  puts "----------------------------------------------------------------------------"
  puts "The Inferior function is the least preferred function, so for example if Thinking (T) was your dominant function, Feeling (F) would be your least preferred function. You tend to be less interested in doing activities associated with your inferior function and have less skills associated with it."
  puts ""
end

def intro_function_pair
  puts "************************************************************************"
  puts ""
  puts "Overview of Function Pairs"
  puts "----------------------------------------------------------------------------"
  puts "One of the key aspects of psychological type is the combination of the Sensing or Intuition preference with the Thinking or Feeling preference. The possible combinations – ST, SF, NF, and NT, which form the four columns of the type table, are called function pairs because they say so much about how we function in life."
  puts ""
end

def give_info(name, mbti)
  greeting(name, mbti)
  loop do
    mbti_array = mbti.split("")
    preference = ask_for_info(name, mbti)
      if preference == '1'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.mbti_overview
        obj.find_ppl_matching_type
        press_return_menu
      elsif preference == '2'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(mbti_array[0])
        obj.find_ppl_matching_mind
        press_return_menu
      elsif preference == '3'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(mbti_array[1])
        obj.find_ppl_matching_energy
        press_return_menu
      elsif preference == '4'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(mbti_array[2])
        obj.find_ppl_matching_nature
        press_return_menu
      elsif preference == '5'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        obj.get_letter_desc(mbti_array[3])
        obj.find_ppl_matching_tactics
        press_return_menu
      elsif preference == '6'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        intro_dominant_function
        obj.get_dominant_function
        press_return_menu
      elsif preference == '7'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        intro_auxiliary_function
        obj.get_auxiliary_function
        press_return_menu
      elsif preference == '8'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        intro_tertiary_function
        obj.get_tertiary_function
        press_return_menu
      elsif preference == '9'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        intro_inferior_function
        obj.get_inferior_function
        press_return_menu
      elsif preference == '10'
        slow_down
        obj = Person.all.find {|person| person.name == name}
        intro_function_pair
        obj.function_pair_desc
        obj.find_ppl_matching_function_pair
        press_return_menu
      elsif preference == '11'
        puts "Compatibility function  coming soon!"
      elsif preference == '12'
        puts "changing MBTI function coming soon!"
      elsif preference == '13'
        puts "changing name function coming soon!"
      elsif preference == "exit"
        break
      else
        puts "******Input not recognized******"
    end
  end
end
