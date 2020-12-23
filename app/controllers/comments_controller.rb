class CommentsController < ApplicationController
  def create
    @tourism = Tourism.find(params[:tourism_id])
    @comment = @tourism.comments.new(tourism_comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @tourism_comment = Comment.new
    @tourism_comments = @tourism.comments
  end

  def destroy
    @tourism = Tourism.find(params[:tourism_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    @tourism_comment = Comment.new
    @tourism_comments = @tourism.comments
  end



  private
  def tourism_comment_params
    params.require(:comment).permit(:comment)
  end

end
