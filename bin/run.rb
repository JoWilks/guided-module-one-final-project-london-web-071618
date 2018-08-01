require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'

welcome
name = get_name_from_user
mbti = get_mbti_from_user
obj = save_user(name, mbti)
give_info(name, mbti)
