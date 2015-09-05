class AddStoryIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :story_token, :string
  	add_column :pictures, :story_id, :integer
  end
end
