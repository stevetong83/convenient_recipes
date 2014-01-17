class Recipe < ActiveRecord::Base

  # field :title,         type: string
  # field :ingredients,   type: text
  # field :instructions,  type: text
  # field :prep_time,     type: integer
  # field :cook_time,     type: cook_time
  # field :credits
  # field :public,          type: Boolean,      default: true

  belongs_to :user

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  after_create :has_recipes
  after_destroy :no_recipes

  default_scope order_by("updated_at DESC")

  scope :public, -> { where(public: true) }
  scope :private, -> { where(public: false) }

  private

    def has_recipes
      user.update_attributes(has_recipes: true) if user.recipes.count >= 1
    end

    def no_recipes
      user.update_attributes(has_recipes: false) if user.recipes.count == 0
    end
end
