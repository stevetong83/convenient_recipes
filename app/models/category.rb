class Category < ActiveRecord::Base

  # field :name

  has_many :recipes

  validates :name, :recipe_id, presence: true
  
end
