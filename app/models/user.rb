class User < ActiveRecord::Base

  attr_accessible :name, :username, :email, :password, :password_confirmation

  devise :database_authenticatable, :token_authenticatable,
         :validatable, :recoverable, :rememberable, :trackable

  has_many :posts
  has_many :feed_items

  has_many :follows_where_they_are_doing_the_following, :foreign_key => :follower_id, :class_name => 'Follow'
  has_many :followings, :through => :follows_where_they_are_doing_the_following

  has_many :follows_where_they_are_being_followed, :foreign_key => :following_id, :class_name => 'Follow'
  has_many :followers, :through => :follows_where_they_are_being_followed

  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :case_sensitive => false
  validates_length_of :username, :maximum => 15
  validates_format_of :username, :with => /^[a-zA-Z0-9\_]*?$/, :message => "can only contain letters, numbers and underscores"
  validates_format_of :username, :with => /^[a-zA-Z]/, :message => "must begin with a letter"

  def follow user
    Follow.create { |r| r.follower = self; r.following = user }
  end

  def unfollow user
    Follow.find_by_follower_id_and_following_id(self.id, user.id).destroy rescue nil
  end

  def following? user
    Follow.find_by_follower_id_and_following_id(self.id, user.id).present?
  end

  def to_s
    username
  end

  def to_param
    to_s
  end

end
