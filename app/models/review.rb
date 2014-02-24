class Review < ActiveRecord::Base

  #field :user_id
  #field :recipe_id
  #field :review
  #field :rating

  belongs_to :user
  belongs_to :recipe
  
  validates :user_id, :recipe_id, :review, :rating, presence: true

  default_scope { order("created_at DESC") }

end
