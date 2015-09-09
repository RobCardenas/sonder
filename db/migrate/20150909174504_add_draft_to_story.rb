class AddDraftToStory < ActiveRecord::Migration
  def change
  	add_column :stories, :draft, :boolean, :default => true
  end
end
