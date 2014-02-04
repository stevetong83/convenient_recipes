class Recipe < ActiveRecord::Base

  # field :user_id,       type: integer
  # field :title,         type: string
  # field :ingredients,   type: text
  # field :instructions,  type: text
  # field :prep_time,     type: integer
  # field :cook_time,     type: cook_time
  # field :credits
  # field :public,        type: Boolean,      default: true

  belongs_to :user

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  default_scope order("updated_at DESC")

  scope :public, -> { where(public: true) }
  scope :private, -> { where(public: false) }


end
