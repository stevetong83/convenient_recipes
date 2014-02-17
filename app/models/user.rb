class User < ActiveRecord::Base

  # field :name, type: String
  # field :slug, type: String

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes

  # User Following Relationships
  has_many :reverse_relationships, foreign_key: "user_id", class_name: "Relationship", dependent: :destroy
  has_many :followed_users, through: :reverse_relationships, source: :followed

  has_many :relationships, foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :relationships, source: :user

  # Favorite Recipes
  has_many :favorites, dependent: :destroy
  has_many :favorite_recipes, through: :favorites, source: :recipe

  validates :name, presence: true

  def follow! user
    relationship = self.reverse_relationships.build(followed_id: user.id)
    relationship.accepted = true if user.approval_required == false
    relationship.save
  end

  def favorite_recipe! recipe
    favorite = self.favorites.build(recipe: recipe)
    favorite.save
  end

  def slug_candidates
    [
      :name,
      [:name, User.where(name: self.name).count + 1]
    ]
  end

end
