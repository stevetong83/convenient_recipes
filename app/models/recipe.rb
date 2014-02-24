class Recipe < ActiveRecord::Base

  # field :user_id,       type: integer
  # field :name,         type: string
  # field :ingredients,   type: text
  # field :instructions,  type: text
  # field :prep_time,     type: integer
  # field :cook_time,     type: integer
  # field :credits,       type: text
  # field :public,        type: Boolean,      default: true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  default_scope { order("updated_at DESC") }

  scope :public, -> { where(public: true) }
  scope :private, -> { where(public: false) }

  def split_ingredients
    self.ingredients.split("\r\n")
  end


  def should_generate_new_friendly_id?
    new_record?
  end

  def slug_candidates
    [
      :name,
      [:name, Recipe.where(name: self.name).count + 1]
    ]
  end

end
