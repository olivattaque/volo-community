class PagesController < ApplicationController
  def index
      @users = User.all
      @activities = PublicActivity::Activity.limit(5).order("created_at DESC")
  end
  
  def timeline
      @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
  
  def about
  end
end
