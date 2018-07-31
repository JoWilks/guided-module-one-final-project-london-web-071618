class CreatePeopleLetterFourletterTables < ActiveRecord::Migration

  def change
    create_table :people do |t|
      t.string :name
      t.string :mind
      t.string :energy
      t.string :nature
      t.string :tactics
    end

    create_table :letters do |t|
      t.string :letter
      t.string :description
    end

    create_table :four_letters do |t|
      t.string :myers_briggs_type
      t.string :subtitle
      t.string :description
    end

    create_table :person_letter do |t|
      t.integer :person_id
      t.integer :letter_id
    end
  end

end
