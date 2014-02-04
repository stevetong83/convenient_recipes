class User < ActiveRecord::Base

  # field :name, type: String

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :reverse_relationships, foreign_key: "user_id", class_name: "Relationship", dependent: :destroy
  has_many :followed_users, through: :reverse_relationships, source: :followed

  has_many :relationships, foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :relationships, source: :user


  validates :name, presence: true

  def follow! user
    relationship = self.reverse_relationships.build(followed_id: user.id)
    relationship.accepted = true if user.approval_required == false
    relationship.save
  end

  def favorite_recipe! recipe

  end

end
