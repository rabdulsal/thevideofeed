class Person < ActiveRecord::Base
  validates_presence_of   :username
  validates_uniqueness_of :username

  has_many :posts
  has_many :videos, through: :posts

  def post(key)
    video = Video.find_or_create_by_key(key)
    posts.find_or_create_by_video_id(video.id)
  end
end
