class RenamePersonletterPersonletters < ActiveRecord::Migration

  def change
    rename_table :person_letter, :person_letters
  end
end
