class Video < ActiveRecord::Base

  # attr_accessible not needed, videos are only user-accessible via posts

  MAX_PER_PAGE = 5

  has_many :posts

  before_validation :set_attrs_via_embedly, :on => :create

  validates_presence_of :url, :html, :title
  validates_uniqueness_of :url

  def self.get opts={}
    opts[:page] ||= 1
    opts.merge! :per_page => Video::MAX_PER_PAGE, :order => 'videos.created_at desc'
    paginate opts
  end

  def set_attrs_via_embedly
    errors[:base] << "is not valid" unless Embedly.valid_url?(url)
    attrs = Embedly.get_attrs url
    errors[:base] << "is not a video" unless attrs['type'] == 'video'
    attrs['title'] ||= 'untitled'
    attrs['url'] ||= url
    self.attributes = attrs
  end

  def to_s
    title
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end

end
