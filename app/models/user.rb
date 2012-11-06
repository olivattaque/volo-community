# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  username               :string(255)
#

class User < ActiveRecord::Base
  include Gravtastic
  include PublicActivity::Model
  extend FriendlyId
  acts_as_followable
  acts_as_follower
  acts_as_voter
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  tracked :owner => proc {|controller, model| model}, :only => [:create]
    
  gravtastic :secure => true, :default => '#{Rails.root}/public/images/gravatar_default.jpeg'
  friendly_id :username
  
  has_many :video_posts

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates :username, :presence => true, :length => { :in => 2..20 }, :uniqueness => true
  
  def confirmation_required?
    if Rails.env.development?
      return false
    else
      return !confirmed?
    end
  end
end
