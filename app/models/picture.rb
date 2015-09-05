class Picture < ActiveRecord::Base
	
	belongs_to :story

	has_attached_file :image,
                   	:styles => { :large => "800x400>", :medium => "400x200>", :thumb => "100x50>" },
	                 	:path => "images/:id/:style/image.:extension",
  									:storage => :s3,
  									:s3_credentials => Proc.new { |a| a.instance.s3_credentials },
  									:s3_host_name => 's3.amazonaws.com'

  def s3_credentials
    { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

 	validates_attachment :image, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
                       :size => { :in => 0..50000.kilobytes }

end
