class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.string :photo
      t.string :type

      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :recipe_id
  end
end
