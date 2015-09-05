class AddCoverToStories < ActiveRecord::Migration
  def change
  	add_column :pictures, :gallery_token, :string
  	add_column :stories, :cover, :integer
  	add_column :stories, :token, :string
  end
end
