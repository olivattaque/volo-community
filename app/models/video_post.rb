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
  include PublicActivity::Model
  tracked :owner => proc {|controller, model| controller.current_user},
          :params => {
            :summary => proc {|controller, model| model.video_information.title}   # by default save truncated summary of the post's body
          }
  acts_as_commentable
  is_impressionable
  acts_as_votable
  
  belongs_to :user
  belongs_to :video_information
  
  attr_accessible :video_information_id
end