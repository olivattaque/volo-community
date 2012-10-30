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

require 'test_helper'

class VideoPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
