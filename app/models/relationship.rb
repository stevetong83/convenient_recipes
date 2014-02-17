class Relationship < ActiveRecord::Base

  # field :user_id
  # field :followed_id
  # field :accepted

  belongs_to :followed, class_name: "User"
  belongs_to :user

  validates :user_id, :followed_id, presence: true
  validates :user_id, uniqueness: {scope: :followed_id}
end
