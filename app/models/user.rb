class User < ActiveRecord::Base
  include Gravtastic
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  gravtastic :secure => true, :default => '#{Rails.root}/public/images/gravatar_default.jpeg'

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  
  validates :username, :presence => true, :length => { :in => 2..20 }, :uniqueness => true
end
