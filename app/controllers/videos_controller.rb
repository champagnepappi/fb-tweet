class VideosController < ApplicationController
  before_action :already_logged_in
  
  def new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to current_user
    else
      redirect_to current_user
      flash[:danger] = "There was a problem posting the video"
    end
  end

  def show
    @video = Video.find_by(id: params[:video_id])
  end

  private
  def video_params
    params.require(:video).permit(:content, :video)
  end
end
