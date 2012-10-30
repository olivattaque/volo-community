class AddVideoIdAndProviderToVideoInformation < ActiveRecord::Migration
  def change
    add_column :video_informations, :video_id, :string
    add_column :video_informations, :provider, :string
  end
end
