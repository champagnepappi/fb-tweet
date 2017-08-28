class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to Video.find(@comment.video_id)
    else
      flash[:danger] = "There was a problem "
      redirect_to Video.find(@comment.video_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :video_id)
  end

  def correct_user
    @comment = Comment.find_by(id: params[:id])
    redirect_to root_url if @comment.nil
  end
end
