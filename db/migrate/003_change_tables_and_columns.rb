class ChangeTablesAndColumns < ActiveRecord::Migration

  def change
    rename_column :person_letters, :letter_id, :mind_id
    add_column :person_letters, :energy_id, :integer
    add_column :person_letters, :nature_id, :integer
    add_column :person_letters, :tactics_id, :integer
    add_column :person_letters, :four_letter_id, :integer
    remove_column :people, :mind
    remove_column :people, :energy
    remove_column :people, :nature
    remove_column :people, :tactics
  end
end
