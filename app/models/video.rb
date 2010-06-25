class Video < ActiveRecord::Base

  # attr_accessible # videos not user-accessible, so no need to protect assignment

  has_many :posts

  before_validation :set_attrs_via_embedly, :set_default_title_if_blank, :on => :create

  validates_presence_of :url, :html, :width, :height, :version, :title
  validates_uniqueness_of :url
  validates_numericality_of :width, :height

  before_update :not_implemented
  before_destroy :not_implemented

  def set_attrs_via_embedly
    attrs = Embedly.get_attrs(url)
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
