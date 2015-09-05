class Picture < ActiveRecord::Base
	
	belongs_to :story

	has_attached_file :image,
                   :styles => { :large => "800x400>", :medium => "400x200>", :thumb => "100x50>" },
                   :default_url => "/images/:style/missing.png"

 	validates_attachment :image, :presence => true,
                      :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
                      :size => { :in => 0..50000.kilobytes }

end
