class Follow < ActiveRecord::Base

  attr_accessible # this space intentionally left blank

  belongs_to :follower, :class_name => 'User', :counter_cache => :followings_count
  belongs_to :following, :class_name => 'User', :counter_cache => :followers_count

  validates_presence_of :follower_id
  validates_presence_of :following_id
  validates_uniqueness_of :follower_id, :scope => :following_id
  validate :cannot_follow_self

  after_create :backfill_posts

  def cannot_follow_self
    errors.add(:following_id) if follower == following
  end

  def backfill_posts
    FeedItem.backfill(follower, following)
  end

end
