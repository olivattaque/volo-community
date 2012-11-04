class PagesController < ApplicationController
  def index
      @users = User.all
      @activities = PublicActivity::Activity.limit(5)
  end
  
  def timeline
      @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => 10)
  end
  
  def about
  end
end
