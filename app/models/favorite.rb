class Favorite < ActiveRecord::Base
  attr_accessor :key, :title, :views, :source, :thumbnail_url
  attr_accessible :key, :title, :created_at, :views, :person_id, :source, :thumbnail_url

  validates_presence_of   :video_id, :person_id
  validates_uniqueness_of :video_id, scope: :person_id

  belongs_to :person
  belongs_to :video

  before_validation :find_or_create_video, on: :create
  after_create :update_video_first_person

  def find_or_create_video
    if video = Video.find_by_key_and_source(key, source)
      self.video = video
    else
      self.video = Video.create(key: key, title: title, created_at: created_at, views: views, source: source, thumbnail_url: thumbnail_url)
    end
  end

  def update_video_first_person
    video.first_person = video.favorites.order('created_at asc').first.person
    video.save!
  end
end
