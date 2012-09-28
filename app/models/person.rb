class Person < ActiveRecord::Base
  attr_accessible :username

  validates :username, presence: true, uniqueness: true

  has_many :favorites
  has_many :videos, through: :favorites
end
