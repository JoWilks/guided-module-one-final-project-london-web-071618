require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'

welcome
name = get_name_from_user
existing = Person.find_by_name(name)
  if existing == nil
    slow_down
    mbti = get_mbti_from_user
    save_user(name, mbti)
  else
    loop do
      slow_down
      input = name_exists(existing)
      if input == 'no'
        slow_down
        mbti = get_mbti_from_user
        break
      elsif input == 'yes'
        slow_down
        mbti = existing.four_letter
        break
      else
        slow_down
        puts "******Invalid input, please type 'yes' or 'no'******"
        # name_exists(existing)
      end
    end
end

give_info(name, mbti)
