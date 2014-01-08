class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :follow_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
