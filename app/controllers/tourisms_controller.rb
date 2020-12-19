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
    #全てのスポットを取り出す
    @tourisms = Tourism.all
    #もし[: ]の値が存在して入ればindexページに表示する==================================
    if params[:prefecture_id].present?
      @prefecture_name = Prefecture.find(params[:prefecture_id]).name
      @tourisms = @tourisms.where(prefecture_id: params[:prefecture_id])
    end
    if params[:genre_id].present?
      @genre_name = Genre.find(params[:genre_id]).genre
      @tourisms = @tourisms.where(genre_id: params[:genre_id])
    end
    if params[:budget].present?
      @budget = params[:budget]
      @tourisms = @tourisms.where("tourisms.budget <= ?", params[:budget])
    end
    # =ここまで=========================================================================

  end




  def show
    @tourism = Tourism.find(params[:id])
    @user = @tourism.user
    @tourism_new = Tourism.new
    @tourism_comment = Comment.new
    @tourism_comments = @tourism.comments
    # jsで使用できるように定義
    gon.address = @tourism.address
  end


  private

  def tourism_params
    params[:tourism][:user_id] = current_user.id
    params.require(:tourism).permit(:user_id, :genre_id, :prefecture_id, :name, :production, :budget, :address, images_images: [])
  end


end
