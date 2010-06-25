class Post < ActiveRecord::Base

  attr_accessor :url
  attr_accessible :url

  belongs_to :user
  belongs_to :video

  before_validation :canonicalize_url, :validate_url, :find_or_create_video_by_url, :on => :create

  validates_presence_of :user_id, :video_id
  validates_uniqueness_of :video_id, :scope => :user_id

  before_update :not_implemented
  before_destroy :not_implemented

  def canonicalize_url
    self.url = url.gsub(/(https?)(:\/\/)(www\.)?/, '').insert(0, 'http://www.').chomp if url
  end

  def validate_url
    errors[:base] << "is not a valid video url" unless Embedly.valid_url?(url)
  end

  def find_or_create_video_by_url
    self.video = Video.find_or_create_by_url(:url => url) if url
  end

  def not_implemented
    raise 'NotImplementedError'
  end

end
