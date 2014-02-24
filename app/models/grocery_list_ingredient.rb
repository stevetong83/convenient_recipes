class GroceryListIngredient < ActiveRecord::Base

  # field :user_id
  # field :name
  # field :purchased, type: Boolean

  # indexes: :user_id

  validates :user_id, :name, presence: true
end
