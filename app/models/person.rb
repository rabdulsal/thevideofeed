class Person < ActiveRecord::Base
  attr_accessible :youtube_username, :vimeo_username

  validate :youtube_or_vimeo_username
  validates :youtube_username, uniqueness: true, :unless => "youtube_username.nil?"
  validates :vimeo_username, uniqueness: true, :unless => "vimeo_username.nil?"

  has_many :favorites
  has_many :videos, through: :favorites

  def username
    name = []
    name.push youtube_username unless youtube_username.blank?
    name.push vimeo_username unless vimeo_username.blank?
    name.join("/")
  end

  def most_recent_video_with_source(source)
    videos.where(source: source).order("created_at DESC").first
  end

  private

    def youtube_or_vimeo_username
      if youtube_username.blank? and vimeo_username.blank?
        errors[:base] << "Specify a YouTube or Vimeo username (or both)"
      end
    end


end
