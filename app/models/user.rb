class User < ActiveRecord::Base
	require 'bcrypt'
	has_secure_password
	has_many :posts, dependent: :destroy
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
	validates :email, uniqueness: true
	validates :password_digest, presence: true
end
