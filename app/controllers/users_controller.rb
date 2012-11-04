class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at DESC").where(owner_type: "User", owner_id: @user.id).limit(5)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def follow
    user = User.find(params[:id])
    if current_user.following?(user)
      current_user.stop_following(user)
    else
      current_user.follow(user)
    end
    redirect_to user
  end
end
