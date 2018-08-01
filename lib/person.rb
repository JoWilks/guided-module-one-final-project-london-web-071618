class Person < ActiveRecord::Base
  has_many :letters, through: :person_letters

  def associate
    four_letter_array = self.four_letter.split("")
    newpl = PersonLetter.new
    newpl.person_id = self.id
    newpl.mind_id = Letter.all.find{|letter| letter.letter == four_letter_array[0]}.save
    newpl.energy_id = Letter.all.find{|letter| letter.letter == four_letter_array[1]}.save
    newpl.nature_id = Letter.all.find{|letter| letter.letter == four_letter_array[2]}.save
    newpl.tactics_id = Letter.all.find{|letter| letter.letter == four_letter_array[3]}.save
  end
end
