class Video < ActiveRecord::Base
  attr_accessible :key, :title, :created_at

  validates :key, presence: true, uniqueness: true

  has_many :people, through: :favorites

  def to_s
    "http://www.youtube.com/watch?v=#{key}"
  end
end
