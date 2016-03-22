class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :position
      t.string :yield
      t.string :prep_time
      t.string :cook_time
      t.text :description
      t.text :ingredients
      t.text :method
      t.text :possible_combination

      t.timestamps null: false
    end
  end
end
