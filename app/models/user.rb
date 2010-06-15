class User < ActiveRecord::Base

  attr_accessible :name, :username, :email, :password, :password_confirmation

  devise :database_authenticatable, :token_authenticatable,
         :validatable, :recoverable, :rememberable,
         :lockable, :trackable

  validates_presence_of :name, :username
  validates_uniqueness_of :username
  validates_length_of :username, :maximum => 15
  validates_format_of :username, :with => /^[a-zA-Z0-9\_]*?$/, :message => "can only contain letters, numbers and underscores"
  validates_format_of :username, :with => /^[a-zA-Z]/, :message => "must begin with a letter"

  before_destroy :destroy_not_implemented

  def destroy_not_implemented
    raise 'NotImplementedError'
    # notes about what would need cleaning up...
  end

  def to_param
    username
  end

  def to_s
    username
  end

end
