class Video < ActiveRecord::Base

  attr_accessible # n/a

  has_many :posts

  before_validation :set_attrs_via_oembed, :set_default_title_if_blank, :on => :create

  validates_presence_of :canonical_url, :html, :width, :height, :version, :title
  validates_uniqueness_of :canonical_url
  validates_numericality_of :width, :height

  before_update :not_implemented
  before_destroy :not_implemented

  def set_attrs_via_oembed
    # TODO validate against regexp, get response from embedly, confirm is video
    # set attrs, etc
  end

  def set_default_title_if_blank
    title = 'untitled' if title.blank?
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
