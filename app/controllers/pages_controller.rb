class PagesController < ApplicationController
  def index
      @users = User.all
  end
  
  def about
  end
end
