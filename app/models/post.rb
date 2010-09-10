class Post < ActiveRecord::Base

  attr_accessor :url
  attr_accessible :url

  belongs_to :user, :counter_cache => :posts_count
  belongs_to :video, :counter_cache => :posts_count

  before_validation :find_or_create_video_by_url, :on => :create

  validates_presence_of :user_id
  validates_presence_of :video_id, :message => 'could not be found or is not embeddable'
  validates_uniqueness_of :video_id, :scope => :user_id

  after_create :create_feed_items

  def self.get opts={}
    opts[:page] ||= 1
    opts.merge! :per_page => Video::MAX_PER_PAGE, :order => 'posts.created_at desc'
    paginate opts
  end

  def find_or_create_video_by_url
    self.video = Video.find_or_create_by_url(:url => url) if url
  end

  def create_feed_items
    FeedItem.populate self
  end

  def to_cache
    to_json :only => [], :include => {
      :user => {:only => [:email, :name, :username],
        :methods => [:to_s, :to_param]
        },
      :video => {:only => [:url],
        :methods => [:to_s, :to_param, :embedly]
        }
      }
  end

end
