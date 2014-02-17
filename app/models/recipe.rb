class Recipe < ActiveRecord::Base

  # field :user_id,       type: integer
  # field :title,         type: string
  # field :ingredients,   type: text
  # field :instructions,  type: text
  # field :prep_time,     type: integer
  # field :cook_time,     type: cook_time
  # field :credits
  # field :public,        type: Boolean,      default: true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  default_scope { order("updated_at DESC") }

  scope :public, -> { where(public: true) }
  scope :private, -> { where(public: false) }


  def should_generate_new_friendly_id?
    new_record?
  end

  def slug_candidates
    [
      :title,
      [:title, Recipe.where(title: self.title).count + 1]
    ]
  end

end
