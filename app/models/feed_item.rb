class FeedItem < ActiveRecord::Base

  attr_accessible # this space intentionally left blank

  belongs_to :user
  belongs_to :post
  belongs_to :poster, :foreign_key => 'poster_id', :class_name => 'User'
  belongs_to :video

  validates_presence_of :user_id, :post_created_at, :post_id, :poster_id, :video_id, :post_cache
  validates_uniqueness_of :post_id, :scope => :user_id
  validates_uniqueness_of :video_id, :scope => :user_id

  def self.get opts={}
    opts[:page] ||= 1
    opts.merge! :per_page => Video::MAX_PER_PAGE, :order => 'feed_items.post_created_at desc'
    paginate opts
  end

  def self.populate post
    users = []
    users << post.user # poster's feed
    post.user.followers.find_each do |follower|
      users << follower # poster's followers' feed
    end if post.user.followers.present?
    users.each do |user|
      FeedItem.insert(user, post)
    end
  end

  def self.backfill(follower, following)
    following.posts.find_each do |post|
      FeedItem.insert(follower, post)
    end
  end

  def self.insert user, post
    FeedItem.create do |f|
      f.user_id = user.id
      f.post_created_at = post.created_at
      f.post_id = post.id
      f.poster_id = post.user_id
      f.video_id = post.video_id
      f.post_cache = post.to_cache
    end
  end

  def cached_post
    JSON.parse(post_cache)['post']
  end

end
