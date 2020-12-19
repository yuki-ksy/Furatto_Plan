class FavoritesController < ApplicationController
  def create
    @tourism = Tourism.find(params[:tourism_id])
    favorite = current_user.favorites.build(tourism_id: params[:tourism_id])
    favorite.save
  end
  def destroy
    @tourism = Tourism.find(params[:tourism_id])
    favorite = Favorite.find_by(user_id: current_user.id, tourism_id: params[:tourism_id])
    favorite.destroy
  end
end
