class Video < ActiveRecord::Base
  attr_accessible :key, :created_at

  validates :key, presence: true, uniqueness: true

  has_many :people, through: :posts
end
