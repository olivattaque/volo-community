# == Schema Information
#
# Table name: video_informations
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :text
#  keywords        :text
#  duration        :integer
#  video_url       :string(255)
#  thumbnail_small :string(255)
#  thumbnail_large :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  video_id        :string(255)
#  provider        :string(255)
#

class VideoInformation < ActiveRecord::Base
  has_many :video_posts
  
  def self.create_from_video_info(video_info, url)
    video_information = self.new
    video_information.video_id = video_info.video_id
    video_information.provider = video_info.provider
    video_information.video_url = url
    video_information.title = video_info.title
    video_information.description = video_info.description
    video_information.keywords = video_info.keywords
    video_information.duration = video_info.duration
    video_information.thumbnail_small = video_info.thumbnail_small
    video_information.thumbnail_large = video_info.thumbnail_large
    video_information
  end
end
