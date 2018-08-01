class AddFourLetterToPeople < ActiveRecord::Migration

  def change
    add_column :people, :four_letter, :string
  end
end
