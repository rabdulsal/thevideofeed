class Favorite < ActiveRecord::Base
  attr_accessor :key
  attr_accessible :key, :created_at

  validates_presence_of   :video_id, :person_id
  validates_uniqueness_of :video_id, scope: :person_id

  belongs_to :video

  before_validation :find_or_create_video, on: :create

  def find_or_create_video
    if video = Video.find_by_key(key)
      self.video = video
    else
      self.video = Video.create(key: key, created_at: created_at)
    end
  end
end
