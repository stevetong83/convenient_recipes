class RecipePhoto < Photo

  validates :recipe_id, presence: true
end
