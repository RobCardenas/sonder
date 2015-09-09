class Story < ActiveRecord::Base

	belongs_to :user
	has_many :pictures, dependent: :destroy

	validates :name, :description, presence: true

	# validates :pictures,
	# 					presence: true
	
end
