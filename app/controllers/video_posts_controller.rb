class VideoPostsController < ApplicationController
  before_filter :redirect_to_signin, :only => [:new,:create]
  
  # GET /video_posts
  # GET /video_posts.json
  def index
    @video_posts = VideoPost.paginate(:page => params[:page], :per_page => 1).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video_posts }
    end
  end

  # GET /video_posts/1
  # GET /video_posts/1.json
  def show
    @video_post = VideoPost.find(params[:id])
    @video_information = @video_post.video_information

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_post }
    end
  end

  # GET /video_posts/new
  # GET /video_posts/new.json
  def new
    @video_post = VideoPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_post }
    end
  end

  # GET /video_posts/1/edit
  def edit
    @video_post = VideoPost.find(params[:id])
  end

  # POST /video_posts
  # POST /video_posts.json
  def create
    # @video_post = VideoPost.new(params[:video_post])
    video_info = VideoInfo.new(params[:video_url])
    if video_info.valid?
      video_information = VideoInformation.create_from_video_info(video_info, params[:video_url])
      if video_information.save
        @video_post = current_user.video_posts.build(:video_information_id => video_information.id)

        respond_to do |format|
          if @video_post.save
            format.html { redirect_to @video_post, notice: 'Video post was successfully created.' }
            format.json { render json: @video_post, status: :created, location: @video_post }
          else
            format.html { render action: "new" }
            format.json { render json: @video_post.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render action: "new", notice: 'Error while creating video information' }
        end
      end
    else
      respond_to do |format|
        format.html { render action: "new", notice: 'Error while creating video information' }
      end
    end
  end

  # PUT /video_posts/1
  # PUT /video_posts/1.json
  def update
    @video_post = VideoPost.find(params[:id])

    respond_to do |format|
      if @video_post.update_attributes(params[:video_post])
        format.html { redirect_to @video_post, notice: 'Video post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_posts/1
  # DELETE /video_posts/1.json
  def destroy
    @video_post = VideoPost.find(params[:id])
    @video_post.destroy

    respond_to do |format|
      format.html { redirect_to video_posts_url }
      format.json { head :no_content }
    end
  end
end
