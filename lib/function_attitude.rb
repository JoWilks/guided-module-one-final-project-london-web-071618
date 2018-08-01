class FunctionAttitude < ActiveRecord::Base

  def people
    Person.all.select{|person|
      person.four_letter[0]+person.four_letter[1] == self.name || person.four_letter[0]+person.four_letter[2] == self.name}
  end

  def info
    puts "***"
    puts ""
    puts "#{self.title} (#{self.name})"
    puts "-----------------------------"
    puts  "#{self.description}"
    puts ""
    puts "***"
  end

  
end
