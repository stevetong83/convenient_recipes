class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredients
      t.text :instructions
      t.integer :prep_time
      t.integer :cook_time
      t.text :credits
      t.boolean :public

      t.timestamps
    end
  end
end