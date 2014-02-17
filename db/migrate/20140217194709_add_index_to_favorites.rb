class AddIndexToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, :user_id
    add_index :favorites, :recipe_id
    add_index :favorites, [:user_id, :recipe_id], unique: true
  end
end
