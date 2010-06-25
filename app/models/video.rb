class Video < ActiveRecord::Base

  # attr_accessible not needed, videos are only user-accessible via posts

  has_many :posts

  before_validation :set_attrs_via_embedly, :set_default_title_if_blank, :on => :create

  validates_presence_of :url, :html, :title
  validates_uniqueness_of :url

  before_update :not_implemented
  before_destroy :not_implemented

  def set_attrs_via_embedly
    attrs = Embedly.get_attrs url
    errors[:base] << "is not a video" unless attrs['type'] == 'video'
    self.attributes = attrs
  end

  def set_default_title_if_blank
    self.title = 'untitled' if title.blank?
  end

  def not_implemented
    raise 'NotImplementedError'
  end

  def to_s
    title
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end

end
