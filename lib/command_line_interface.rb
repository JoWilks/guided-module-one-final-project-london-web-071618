
def welcome
  puts "************************************************************************"
  puts"   __     __)                  ______                    "
  puts"  (, /|  /|                   (, /    )    ,             "
  puts"    / | / |       _ __ _        /---(  __   _  _  _      "
  puts" ) /  |/  |_ (_/_(// (/_)_   ) / ____)/ (_((_/(_//_)_    "
  puts"(_/   '     .-/             (_/ (         .-/.-/         "
  puts"           (_/                           (_/(_/          "
  puts"     ______)              _____                          "
  puts"    (, /                 (, /      /) ,                  "
  puts"      /      __   _        / __  _(/   _ _ _/_____       "
  puts"   ) /  (_/_ /_)_(/_   ___/__/ ((_(__((_(_((_(_) (_      "
  puts"  (_/  .-/.-/        (__ /                               "
  puts"      (_/(_/                                             "
  puts ""
  puts "Welcome to the MBTI Analysis generator. Based on the Myers-Briggs Type Indicator, we seek to give you a more in-depth analysis of your personality type."
  puts "-----------------------------"
end

def get_name_from_user
  puts "Please enter your full name."
  puts "-----------------------------"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
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
    printf " #{element}"
    sleep(0.1)}
    puts ""
end

def ask_for_info(name, mbti)
  split_letters = mbti.split(//)
  puts ""
  puts "What would you like to know?"
  puts "----------------------------------------------------------------------------"
  puts "Enter one of the following numbers:"
  puts "0       --To get an overview of what the Myers Briggs Type Indicator (MBTI) is."
  puts "1       --for your full MBTI type analysis."
  puts "2       --for information about what '#{split_letters[0]}' stands for in your MBTI type."
  puts "3       --for information about what '#{split_letters[1]}' stands for in your MBTI type."
  puts "4       --for information about what '#{split_letters[2]}' stands for in your MBTI type."
  puts "5       --for information about what '#{split_letters[3]}' stands for in your MBTI type."
  puts "6       --to learn about your Dominant Cognitive Function."
  puts "7       --to learn about your Auxiliary Cognitive Function."
  puts "8       --to find out about yout Tertiary Cognitive Function."
  puts "9       --to find out about yout Inferior Cognitive Function."
  puts "10      --to learn about your Function Pair."
  puts "11      --to get which MBTI types you're compatible with based on being similar."
  puts "12      --to get which MBTI types you're compatible with based on being complementary."
  puts "13      --to get a list of compatible people, based on your MBTI type."
  puts "14      --to check the database for a person, and see if you're level of compatibility with them."
  puts "15      --to change your MBTI type if #{mbti} isn't your correct MBTI type."
  puts "16      --to correct your name if #{name} isn't correct."
  puts "'exit'  --to exit the program."
  puts "----------------------------------------------------------------------------"
  gets.chomp
end

def intro_dominant_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Dominant Function"
  puts "----------------------------------------------------------------------------"
  puts "Cognitive functions, as profiled by Carl Jung, are different ways of perceiving and judging. All people use all eight cognitive function-attitudes at one point or another, but we have a preference for four of them. The dominant function is the one that dominates your personality, and comes most easily to you."
  puts ""
end

def intro_auxiliary_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Auxiliary Function"
  puts "----------------------------------------------------------------------------"
  puts "Cognitive functions, as profiled by Carl Jung, are different ways of perceiving and judging. All people use all eight cognitive function-attitudes at one point or another, but we have a preference for four of them. The Auxiliary function is your second most developed cognitive function, that helps to balance out your dominant function, being an opposite orientation to it (extraverted if your dominant function is introverted, and vice versa). It can be considered a bridge function, one that connects the dominant function with the tertiary and inferior functions, and represents a more sustainable path to the expansion and integration of one’s type."
  puts ""
end

def intro_tertiary_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Tertiary Functions"
  puts "----------------------------------------------------------------------------"
  puts "The Tertiary function is the opposite function of your auxiliary, and is something people tend to develop later in life after they feel comfortable and confident with their current Dominant and Auxiliary functions. We have facility with it, but it is considered third in priority in the economy of our personality type."
  puts ""
end

def intro_inferior_function
  puts "************************************************************************"
  puts ""
  puts "Overview of Inferior Functions"
  puts "----------------------------------------------------------------------------"
  puts "The Inferior function is the least preferred function, and one that represents a different side to your personality that you might not have thought of developing. You tend to be less interested in doing activities associated with your inferior function and have less skills associated with it."
  puts ""
end

def intro_mind
  puts "************************************************************************"
  puts ""
  puts "Overview of Mind Scale"
  puts "----------------------------------------------------------------------------"
  puts "The Mind scale determines the degree of interaction with the outer world; how socially one behaves is just a part of that. Introversion or extroversion is not about being outgoing or not, but about how we see and approach the outside world, including people, objects and activities within it."
  puts ""
end

def intro_energy
  puts "************************************************************************"
  puts ""
  puts "Overview of Energy Scale"
  puts "----------------------------------------------------------------------------"
  puts "The second scale in our model is called Energy and it connects Intuitive and Observant styles. While the other four scales determine how you interact with the world, this scale actually determines how you see the world and what kind of information you focus on. "
  puts ""
end

def intro_nature
  puts "************************************************************************"
  puts ""
  puts "Overview of Nature Scale"
  puts "----------------------------------------------------------------------------"
  puts "The Nature scale determines how we make decisions and cope with emotions. While we all have feelings, there are significant differences in how we react to them and what role those feelings play in our lives. This then influences other areas, such as our interactions with other people."
  puts ""
end

def intro_tactics
  puts "************************************************************************"
  puts ""
  puts "Overview of Nature Scale"
  puts "----------------------------------------------------------------------------"
  puts "The Tactics scale determines how we approach planning and available options. However, this affects more than just our calendars – at its core, this scale determines our attitude toward certainty and structure in our lives, both at mental and physical levels."
  puts ""
end

def intro_function_pair
  puts "************************************************************************"
  puts ""
  puts "Overview of Function Pairs"
  puts "----------------------------------------------------------------------------"
  puts "One of the key aspects of psychological type is the combination of the Sensing or Intuition preference with the Thinking or Feeling preference. The possible combinations – ST, SF, NF, and NT, which form the four columns of the type table, are called function pairs because they say so much about how we function in life. They primarily profile our method of gathering information and then making decisions."
  puts ""
end

def mbti_intro_overview
  puts "************************************************************************"
  puts ""
  puts "What is the MBTI?"
  puts "----------------------------------------------------------------------------"
  puts "The MBTI is a way of classifying someone's personality type. It was created by Katherine Briggs and her daughter Isabel Briggs Myers, and is based on the works of Carl Jung who studied psychological types. Their aim was to make his complex academic theories more accessible to everyone, which is why they devised a test to help anyone type themselves."
  puts ""
  puts "When you take the test, is asks your several questions about yourself, and from it calculates your personalty type which is based on a combination of 4 letters, which defines your preference for a certain pyschological type. For example people can be more Introverted or Extroverted, whichever function they score higher for will become the first letter of their MBTI."
  puts ""
  puts "The benefit of taking this test and knowing yours MBTI type, is that it can help you understand how you work. By 'how you work', this refers to how your percieve the world, make decisions and interact/relate to other people."
  puts ""
  puts "By knowing this, you can better understand:"
  puts "    -how you handle certain situations."
  puts "    -how to learn more effectively."
  puts "    -how you relate to other people."
  puts "Since you understand these aspects of yourself better, you can also develop strategies to make you perform better at each aspect."
  puts ""
  puts "Knowing the MBTI of other people as well, means you have an understanding of how the other person works, which can make your relationship better. Since this gives you a understanding of how they think etc, you can more effectively relate to them in a positive way."
  puts ""
  puts "There are even further analyses that can come out of your MBTI type, like dominant/auxiliary functions, as well as function pairs. There is also the ability to check your compatibility with other people based on MBTI types, as certain MBTI types more easily relate with other MBTI types."
  puts ""
  puts "If you would like to read further about the MBTI type check out the wikipedia page at: https://en.wikipedia.org/wiki/Myers%E2%80%93Briggs_Type_Indicator"
  puts ""
  puts "************************************************************************"
end

def give_info(name, mbti)
  greeting(name, mbti)
  loop do
    mbti_array = mbti.split("")
    preference = ask_for_info(name, mbti)
    obj = Person.all.find {|person| person.name == name}
      if preference == '0'
        slow_down
        mbti_intro_overview
        press_return_menu
      elsif preference == '1'
        slow_down
        obj.mbti_overview
        obj.find_ppl_matching_type
        press_return_menu
      elsif preference == '2'
        slow_down
        intro_mind
        obj.get_letter_desc(mbti_array[0])
        obj.find_ppl_matching_mind
        press_return_menu
      elsif preference == '3'
        slow_down
        intro_energy
        obj.get_letter_desc(mbti_array[1])
        obj.find_ppl_matching_energy
        press_return_menu
      elsif preference == '4'
        slow_down
        intro_nature
        obj.get_letter_desc(mbti_array[2])
        obj.find_ppl_matching_nature
        press_return_menu
      elsif preference == '5'
        slow_down
        intro_tactics
        obj.get_letter_desc(mbti_array[3])
        obj.find_ppl_matching_tactics
        press_return_menu
      elsif preference == '6'
        slow_down
        intro_dominant_function
        obj.get_dominant_function
        press_return_menu
      elsif preference == '7'
        slow_down
        intro_auxiliary_function
        obj.get_auxiliary_function
        press_return_menu
      elsif preference == '8'
        slow_down
        intro_tertiary_function
        obj.get_tertiary_function
        press_return_menu
      elsif preference == '9'
        slow_down
        intro_inferior_function
        obj.get_inferior_function
        press_return_menu
      elsif preference == '10'
        slow_down
        intro_function_pair
        obj.function_pair_desc
        obj.find_ppl_matching_function_pair
        press_return_menu
      elsif preference == '11'
        #to get which MBTI types you're compatible with based on your Dominant Function.
        slow_down
        obj.get_compatibility_by_similarity
        obj.get_similar_ppl
        press_return_menu
      elsif preference == '12'
        #to get which MBTI types you're compatible with based on your Auxilary Function.
        slow_down
        obj.get_compatibility_by_complementary
        obj.get_complementary_ppl
        press_return_menu
      elsif preference == '13'
        #to get a list of compatible people, based on your MBTI type.
        slow_down
        obj.get_compatible_ppl
        press_return_menu
      elsif preference == '14'
        #to check the database for a person, and see if you're level of compatibility with them
        slow_down
        puts ""
        puts "Here's a list of the people in the database"
        puts "--------------------------------------------"
        Person.all.each {|person|
          if person.name != name
            printf "#{person.name} || "
          end}
        puts ""
        puts "Type in the name of the person you'd like to check your compatibility against."
        puts "------------------------------------------------------------------------------"
        loop do
        person_to_compare = gets.chomp
          if Person.find_by_name(person_to_compare) == nil
            puts "*** Not a name in our database. Please check and re-enter name. ***"
          else
            slow_down
            puts ""
            puts "------------------------------------------------------------------------------"
            obj.get_compatibility(person_to_compare)
            puts "------------------------------------------------------------------------------"
            puts ""
            break
          end
        end
        press_return_menu
      elsif preference == '15'
        #to change your MBTI type if #{mbti} isn't your correct MBTI type.
        user_id = Person.find_by_name(name).id
        update_user_mbti(name, mbti)
        new_name = Person.find(user_id).name
        new_mbti = Person.find(user_id).four_letter
        give_info(new_name, new_mbti)
      elsif preference == '16'
        #to correct your name if #{name} isn't correct.
        user_id = Person.find_by_name(name).id
        update_user_name(name)
        new_name = Person.find(user_id).name
        new_mbti = Person.find(user_id).four_letter
        give_info(new_name, new_mbti)
      elsif preference == "exit"
        break
      else
        puts "******Input not recognized******"
    end
  end
end


def update_user_mbti(name, mbti)
  puts "------------------------------------------------------------------------------"
  puts "This is your current MBTI '#{mbti}', please input your correct MBTI."
  new_mbti = gets.chomp
  puts ""
  id = Person.all.find {|person| person.name == name}
  Person.update(id, four_letter: new_mbti)
  mbti_array = new_mbti.split("")
  mind_letter = Letter.all.find {|letter| letter.letter == mbti_array[0]}.id
  energy_letter = Letter.all.find {|letter| letter.letter == mbti_array[1]}.id
  nature_letter = Letter.all.find {|letter| letter.letter == mbti_array[2]}.id
  tactics_letter =  Letter.all.find {|letter| letter.letter == mbti_array[3]}.id
  four_letter = FourLetter.all.find{|letter| letter.myers_briggs_type == new_mbti}.id
  PersonLetter.update(mind_id:mind_letter, energy_id:energy_letter, nature_id:nature_letter, tactics_id:tactics_letter , four_letter_id:four_letter)
  press_return_menu
end


def update_user_name(name)
  puts "------------------------------------------------------------------------------"
  puts "This is your current name '#{name}', please input your correct name."
  new_name = gets.chomp
  puts ""
  id = Person.all.find {|person| person.name == name}
  Person.update(id, name: new_name)
end
