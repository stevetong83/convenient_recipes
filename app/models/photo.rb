class Photo < ActiveRecord::Base

  # field :user_id
  # field :recipe_id
  # field :photo
  # field :type

  # indexes :user_id, :recipe_id

  validates :user_id, :photo, presence: true
  
end
