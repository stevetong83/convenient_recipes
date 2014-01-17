class Follower < ActiveRecord::Base

  # field user_id,     type: integer
  # field follow_id,   type: integer
  # field accepted,    type: Boolean

  belongs_to :user 
end
