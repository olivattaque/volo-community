# == Schema Information
#
# Table name: video_posts
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  video_information_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class VideoPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :video_information
  
  attr_accessible :video_information_id
end