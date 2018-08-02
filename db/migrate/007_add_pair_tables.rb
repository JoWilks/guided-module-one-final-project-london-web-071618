class AddPairTables < ActiveRecord::Migration

  def change
    create_table :function_pairs do |t|
      t.string :name
      t.string :title
      t.string :description
    end

    create_table :function_attitudes do |t|
      t.string :name
      t.string :title
      t.string :description
    end
  end

end
