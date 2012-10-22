class Person < ActiveRecord::Base
  attr_accessible :name, :youtube_username, :vimeo_username

  validate :validate_youtube_or_vimeo_username
  validates_uniqueness_of :youtube_username, allow_blank: true
  validates_uniqueness_of :vimeo_username, allow_blank: true
  validates_presence_of :name

  has_many :favorites
  has_many :videos, through: :favorites

  def self.add(opts = {})
    Subscriber.create email: opts.delete(:email)
    person = create!(opts)
    Updater.update(person)
  end

  def most_recent_video_with_source(source)
    videos.where(source: source).order('created_at desc').first
  end

  def to_s
    name
  end

  private
    def validate_youtube_or_vimeo_username
      if youtube_username.blank? and vimeo_username.blank?
        errors[:base] << 'Specify a YouTube or Vimeo username (or both)'
      end
    end
end
