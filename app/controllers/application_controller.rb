class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include PublicActivity::StoreController
  include ActionView::Helpers::TextHelper
  
  def redirect_to_signin
    unless user_signed_in?
      flash[:notice] = 'You need to be registered or signed in to use this feature'
      redirect_to new_user_session_path
    end
  end
end
