class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation

  devise :database_authenticatable, :token_authenticatable,
         :validatable, :registerable, :recoverable, :rememberable,
         :lockable, :trackable

end
