class User < ActiveRecord::Base
	has_many :stories, dependent: :destroy
	has_secure_password
end
