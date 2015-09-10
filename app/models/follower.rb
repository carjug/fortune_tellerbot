class Follower < ActiveRecord::Base
  validates_uniqueness_of :name, :twitter_id

  has_many :tweets
end
