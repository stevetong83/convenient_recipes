class User < ActiveRecord::Base

  # field :first_name, type: String
  # field :last_name,  type: String

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :followers

  validates :first_name, :last_name, presence: true




  def follow! user

  end

  def favorite_recipe! recipe

  end

end
