class Person < ActiveRecord::Base
  attr_accessible :username

  validates :username, presence: true, uniqueness: true

  has_many :posts
  has_many :videos, through: :posts
end
