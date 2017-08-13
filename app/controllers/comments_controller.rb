class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
