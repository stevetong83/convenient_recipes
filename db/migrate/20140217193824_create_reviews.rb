class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.text :review
      t.integer :rating
      t.integer :recipe_id

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :recipe_id
  end
end
