class Post < ActiveRecord::Base

  attr_accessor :url
  attr_accessible :url

  belongs_to :user
  belongs_to :video

  before_validation :find_or_create_video_by_url, :on => :create

  validates_presence_of :user_id
  validates_presence_of :video_id, :message => 'could not be found or is not embeddable'
  validates_uniqueness_of :video_id, :scope => :user_id

  default_scope :order => 'created_at DESC'

  def find_or_create_video_by_url
    self.video = Video.find_or_create_by_url(:url => url) if url
  end

end
