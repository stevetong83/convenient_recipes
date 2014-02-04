class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :approval_required, :boolean, default: false
  end
end
