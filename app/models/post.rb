class Post < ActiveRecord::Base

  attr_accessor :url
  attr_accessible :url

  belongs_to :user
  belongs_to :video

  before_validation :canonicalize_url, :find_or_create_video, :on => :create

  validates_presence_of :user_id, :video_id

  before_update :not_implemented
  before_destroy :not_implemented

  def canonicalize_url
    # TODO
  end

  def find_or_create_video
    self.video = Video.find_or_create_by_url(url)
  end

  def not_implemented
    raise 'NotImplementedError'
  end

end
