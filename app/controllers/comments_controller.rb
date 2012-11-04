class CommentsController < ApplicationController

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @video_post = VideoPost.find(params[:video_post_id])
    @comment = @video_post.comments.new(comment: params[:comment][:comment], user_id: current_user)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end