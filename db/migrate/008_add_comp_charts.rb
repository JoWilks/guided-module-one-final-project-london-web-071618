class AddCompCharts < ActiveRecord::Migration

  def change
    create_table :compatibility_charts do |t|
      t.string :main_type
      t.string :very_compatible
      t.string :potentially_compatible
      t.string :least_compatible
    end
  end
end
