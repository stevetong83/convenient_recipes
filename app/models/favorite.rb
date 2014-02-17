class Favorite < ActiveRecord::Base

  # field :user_id
  # field :recipe_id

  belongs_to :recipe
  belongs_to :user

  validates :user_id, :recipe_id, presence: true
  validates :user_id, uniqueness: {scope: :recipe_id}
end
