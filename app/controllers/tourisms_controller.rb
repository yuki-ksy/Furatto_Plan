class TourismsController < ApplicationController
  def new
    @tourism = Tourism.new
  end

  def create
    @tourism = Tourism.new(tourism_params)
    if @tourism.save
      redirect_to tourism_path(@tourism.id)
    else
      @tourisms = Tourism.all
      render :index
    end
  end
  
 

  def index
    @tourisms = Tourism.all
  end

  def show
    @tourism = Tourism.find(params[:id])
    @user = @tourism.user
    @tourism_new = Tourism.new
    @tourism_comment = Comment.new
    @tourism_comments = @tourism.comments
  end

  private
  def tourism_params
    params[:tourism][:user_id] = current_user.id
    params.require(:tourism).permit(:user_id, :genre_id, :prefecture_id, :name, :production, :budget, :latitude, :longitude, images_images: [])
  end
end
