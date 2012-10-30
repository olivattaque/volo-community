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

require 'test_helper'

class VideoInformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
