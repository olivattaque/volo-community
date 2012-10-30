class CreateVideoPosts < ActiveRecord::Migration
  def change
    create_table :video_posts do |t|
      t.references :user
      t.references :video_information
      t.timestamps
    end
  end
end
