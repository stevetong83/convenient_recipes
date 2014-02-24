class CreateGroceryListIngredients < ActiveRecord::Migration
  def change
    create_table :grocery_list_ingredients do |t|
      t.integer :user_id
      t.string :name
      t.boolean :purchased, default: false

      t.timestamps
    end
    add_index :grocery_list_ingredients, :user_id
  end
end
