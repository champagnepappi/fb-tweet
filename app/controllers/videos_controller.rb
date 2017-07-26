class VideosController < ApplicationController
  def new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to current_user
    else
      redirect_to root_path
      flash[:danger] = "There was a problem posting the video"
    end
  end

  def show
  end

  private
  def video_params
    params.require(:video).permit(:content, :video)
  end
end
