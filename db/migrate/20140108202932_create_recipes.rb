class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.text :ingredients
      t.text :instructions
      t.integer :prep_time
      t.integer :cook_time
      t.text :credits
      t.boolean :public, default: true
      t.boolean :low_calorie
      t.boolean :gluten_free
      t.boolean :vegetarian
      t.integer :serving_size

      t.timestamps
    end
    add_index :recipes, :user_id
  end
end
