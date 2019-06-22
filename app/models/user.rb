class User < ApplicationRecord
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requested_friendships,  class_name:  "Friendship",
                                    foreign_key: "friender_id",
                                    dependent:   :destroy
  has_many :pending_friendships,    class_name:  "Friendship",
                                    foreign_key: "friended_id",
                                    dependent:   :destroy
  has_many :requested_friends,      through:     :requested_friendships,
                                    source:      :friended,
                                    dependent:   :destroy
  has_many :pending_friends,        through:     :pending_friendships,
                                    source:      :friender,
                                    dependent:   :destroy

  # Returns an array of all friend requests initiated by user
  def requested_friend_requests
  	requested_friendships.where(accepted: false)
  end

  # Returns an array of all friend requests for user initiated by another user
  def pending_friend_requests
  	pending_friendships.where(accepted: false)
  end

  # Given another friend, returns the friendship between self and that friend
  def find_friendship(friend)
    requested_friendships.find_by(friended_id: friend.id) ||
    pending_friendships.find_by(friender_id: friend.id)
  end

  # Given a friend, unfriends the friend
  def unfriend(friend)
  	find_friendship(friend).destroy
  end

  # Given a potential friendship, returns true if friend request was accepted
  def accepted?(friendship)
    friendship.accepted
  end

  # Returns true if the user is a friend of self
  def is_friend?(user)
    if friendship = find_friendship(user)
      friendship.accepted?
    else
      false
    end
  end

  # Returns array of all users that self has not friended or been friended by
  def not_friended_users
    User.all.select { |user| user != self && find_friendship(user).nil? }
  end

  # Returns an array of all friends
  def friends
    User.all.select { |user| is_friend?(user) }
  end

  # Returns true if self friended the friend
  # and false if friend friended self
  def friended(friend)
    requested_friendships.include? find_friendship(friend)
  end
end
