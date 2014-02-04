class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :followed_id
      t.boolean :accepted, default: false

      t.timestamps
    end

    add_index :relationships, :user_id
    add_index :relationships, :followed_id
    add_index :relationships, [:user_id, :followed_id], unique: true
  end
end
