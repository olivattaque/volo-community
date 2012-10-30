class CreateVideoInformations < ActiveRecord::Migration
  def change
    create_table :video_informations do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.integer :duration
      
      t.string :video_url
      t.string :thumbnail_small
      t.string :thumbnail_large
      t.timestamps
    end
  end
end
