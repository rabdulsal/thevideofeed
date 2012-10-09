class Video < ActiveRecord::Base
  PER_PAGE = 20

  attr_accessible :source, :key, :title, :created_at

  validates :key, presence: true, uniqueness: true
  validates :title, presence: true
  validates :source, presence: true

  has_many :favorites
  has_many :people, through: :favorites
  belongs_to :first_person, class_name: 'Person'
end
