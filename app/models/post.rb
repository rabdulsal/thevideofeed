class Post < ActiveRecord::Base
  attr_accessor :key
  attr_accessible :key, :created_at

  validates_presence_of   :video_id, :person_id
  validates_uniqueness_of :video_id, scope: :person_id

  belongs_to :video

  before_validation :set_video, on: :create

  def set_video
    self.video = Video.find_or_create_by_key(key)
  end
end
