class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true 
  has_secure_password

  has_many :posts
end