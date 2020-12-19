class HomesController < ApplicationController
  def top
     @male_post = User.joins(:tourisms).where(gender: 1)
     @male_favorite = @male_post.joins(:favorites).where(favorites: "count")
     @male_rank = @male_favorite.order("favorites.count DESC")



     users = User.joins(:favorites).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')
     male_favorited_tourism_ids = users.where(gender: 1).pluck('favorites.tourism_id').uniq.take(3)
     @male_favorited_tourisms = Tourism.joins(:favorites).where(id: male_favorited_tourism_ids).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')
     
     
     
     users = User.joins(:favorites).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')
     female_favorited_tourism_ids = users.where(gender: 2).pluck('favorites.tourism_id').uniq.take(3)
     @female_favorited_tourisms = Tourism.joins(:favorites).where(id: female_favorited_tourism_ids).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')
     
  end



  def about
  end
end
