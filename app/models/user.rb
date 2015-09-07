class User < ActiveRecord::Base
	has_many :stories, dependent: :destroy
	has_secure_password

	has_attached_file :avatar,
	                 	:styles => { :medium => "200x200#", :thumb => "100x100#" },
	                 	:path => "avatars/:id/:style/avatar.:extension",
  									:default_url => "https://s3.amazonaws.com/sonderr/defaults/default_avatar.png",
  									:storage => :s3,
  									:s3_credentials => Proc.new { |a| a.instance.s3_credentials },
  									:s3_host_name => 's3.amazonaws.com'

  def s3_credentials
    { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

	validates_attachment :avatar, :presence => true,
	                     :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
	                     :size => { :in => 0..10000.kilobytes }
end
