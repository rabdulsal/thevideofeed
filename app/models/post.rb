class Post < ActiveRecord::Base
  validates_presence_of   :video_id, :person_id
  validates_uniqueness_of :video_id, scope: :person_id

  has_one :video

  after_destroy :destroy_video_if_all_posts_have_been_destroyed

  def destroy_video_if_all_posts_have_been_destroyed
    Video.find(video_id).destroy if Post.where(video_id: video_id).none?
  end
end
