class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # --------------- Verify if the user can add friends. ------

  def self.check_friendship(user, friend)
    response = where(user_id: user, friend_id: friend).exists?
  end

  def self.delete_friendship(user, friend)
    relation = where(user_id: user, friend_id: friend)
  end

end
