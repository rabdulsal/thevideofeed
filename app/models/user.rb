class User < ActiveRecord::Base

  attr_accessible :name, :username, :email, :password, :password_confirmation

  devise :database_authenticatable, :token_authenticatable,
         :validatable, :recoverable, :rememberable,
         :lockable, :trackable

  has_many :posts

  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :case_sensitive => false
  validates_length_of :username, :maximum => 15
  validates_format_of :username, :with => /^[a-zA-Z0-9\_]*?$/, :message => "can only contain letters, numbers and underscores"
  validates_format_of :username, :with => /^[a-zA-Z]/, :message => "must begin with a letter"

  before_destroy :not_implemented

  def not_implemented
    raise 'NotImplementedError'
    # need to clean up posts by user, videos with no other asssociated posts,
    # follows for user, follows by user, feed items for user,
    # feed items by user (delete or change user getting credit for post)
  end

  def to_s
    username
  end

  def to_param
    to_s
  end

end
