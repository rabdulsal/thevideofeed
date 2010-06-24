class Post < ActiveRecord::Base

  attr_accessor :url, :canonical_url
  attr_accessible # n/a

  belongs_to :user
  has_one :video

  before_validation :canonicalize_url, :find_or_create_video_by_canonical_url

  validates_presence_of :user_id, :video_id

  before_update :not_implemented
  before_destroy :not_implemented

  def canonicalize_url
    canonical_url = url # TODO actually canonicalize the url
  end

  def find_or_create_video_by_canonical_url
    self.video = Video.find_or_create_by_canonical_url(self.canonical_url)
  end

  def not_implemented
  end

end
