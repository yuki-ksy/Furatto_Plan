class HomesController < ApplicationController
  def top
    # userとfavoriteをくっつける　tourism_idを1つにまとめる　まとめたidをカウントし、多い順に並びかえる
    users = User.joins(:favorites).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')
    # userテーブルの男性のidを取得　取得したidからtourism_idを抜き出す　uniqで被ったidを弾く　その中から3つだけ取得
    male_favorited_tourism_ids = users.where(gender: 1).pluck('favorites.tourism_id').uniq.take(3)
    # tourismテーブルとfavoritesテーブルを合体　tourism_idをグルーピングして数を調べる　order（）で順番に並びかえる
    @male_favorited_tourisms = Tourism.joins(:favorites).where(id: male_favorited_tourism_ids).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')

    users = User.joins(:favorites).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')
    female_favorited_tourism_ids = users.where(gender: 2).pluck('favorites.tourism_id').uniq.take(3)
    @female_favorited_tourisms = Tourism.joins(:favorites).where(id: female_favorited_tourism_ids).group('favorites.tourism_id').order('count(favorites.tourism_id) desc')
  end

  def about
  end
end
