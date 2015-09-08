class Story < ActiveRecord::Base

	belongs_to :user
	has_many :pictures, dependent: :destroy

 #  validates :name,
 #    presence: true,
 #    length: {maximum: 255}

	# validates :image,
	# 	presence: true
	
end
