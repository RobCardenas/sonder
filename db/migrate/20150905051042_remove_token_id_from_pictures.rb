class RemoveTokenIdFromPictures < ActiveRecord::Migration
  def change
  	remove_column :pictures, :gallery_token, :string
  	remove_column :pictures, :gallery_id, :integer
  end
end
