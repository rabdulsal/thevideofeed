class Video < ActiveRecord::Base
  attr_accessible :key, :title, :created_at

  validates :key, presence: true, uniqueness: true
  validates :title, presence: true

  has_many :favorites
  has_many :people, through: :favorites
  belongs_to :first_person, class_name: 'Person'

  PER_PAGE = 20

  def to_s
    "http://www.youtube.com/watch?v=#{key}"
  end
end
