require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'

welcome
name = get_name_from_user
existing = Person.find_by_name(name)
  if existing == nil
    mbti = get_mbti_from_user
    save_user(name, mbti)
  else
    input = name_exists(existing)
    if input == 'no'
      mbti = get_mbti_from_user
    elsif input == 'yes'
      mbti = existing.four_letter
    else
      puts "Invalid input, please type 'yes' or 'no'"
      name_exists(existing)
    end
end

give_info(name, mbti)
