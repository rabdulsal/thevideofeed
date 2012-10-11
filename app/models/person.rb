class Person < ActiveRecord::Base
  attr_accessible :youtube_username, :vimeo_username

  validate :validate_youtube_or_vimeo_username
  validates_uniqueness_of :youtube_username, allow_blank: true
  validates_uniqueness_of :vimeo_username, allow_blank: true

  has_many :favorites
  has_many :videos, through: :favorites

  def username
    ( [youtube_username] + [vimeo_username] ).compact.join('/')
  end

  def most_recent_video_with_source(source)
    videos.where(source: source).order('created_at desc').first
  end

  private
    def validate_youtube_or_vimeo_username
      if youtube_username.blank? and vimeo_username.blank?
        errors[:base] << 'Specify a YouTube or Vimeo username (or both)'
      end
    end
end
