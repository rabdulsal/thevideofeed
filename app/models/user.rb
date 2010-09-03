class User < ActiveRecord::Base

  attr_accessible :name, :username, :email, :password, :password_confirmation

  devise :database_authenticatable, :token_authenticatable,
         :validatable, :recoverable, :rememberable, :trackable

  has_many :posts

  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :case_sensitive => false
  validates_length_of :username, :maximum => 15
  validates_format_of :username, :with => /^[a-zA-Z0-9\_]*?$/, :message => "can only contain letters, numbers and underscores"
  validates_format_of :username, :with => /^[a-zA-Z]/, :message => "must begin with a letter"

  def to_s
    username
  end

  def to_param
    to_s
  end

end
