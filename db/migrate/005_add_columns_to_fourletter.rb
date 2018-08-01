class AddColumnsToFourletter < ActiveRecord::Migration

  def change
    create_table :function_analysis do |t|
      t.string :symbol
      t.string :name
      t.string :desc
    end
    add_column :four_letters, :dominant_function, :string
    add_column :four_letters, :auxiliary_function, :string
    add_column :four_letters, :tertiary_function, :string
    add_column :four_letters, :inferior_function, :string
  end
end
