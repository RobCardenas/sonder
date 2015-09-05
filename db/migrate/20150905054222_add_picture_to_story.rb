class AddPictureToStory < ActiveRecord::Migration
  def change
    add_reference :stories, :picture, index: true, foreign_key: true
  end
end
