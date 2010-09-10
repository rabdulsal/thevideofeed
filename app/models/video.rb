class Video < ActiveRecord::Base

  # attr_accessible not needed, videos are only user-accessible via posts

  MAX_PER_PAGE = 3

  has_many :posts

  before_validation :set_embedly_attrs, :on => :create

  validates_presence_of :url, :embedly_attrs
  validates_uniqueness_of :url

  def self.get opts={}
    opts[:page] ||= 1
    opts.merge! :per_page => Video::MAX_PER_PAGE, :order => 'videos.created_at desc'
    paginate opts
  end

  def set_embedly_attrs
    errors[:base] << "is not valid" unless Embedly.valid_url?(url)
    attrs = Embedly.get_attrs url
    errors[:base] << "is not a video" unless attrs['type'] == 'video'
    attrs['title'] ||= 'untitled'
    attrs['url'] ||= url
    attrs['html'] = Embedly.clean_html_for attrs['provider_name'], attrs['html']
    self.url = attrs['url']
    self.embedly_attrs = attrs.to_json
  end

  def embedly
    JSON.parse embedly_attrs
  end

  def to_s
    embedly['title']
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end

end
