class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :description
      t.belongs_to :user
      t.timestamps 
    end
  end
end
