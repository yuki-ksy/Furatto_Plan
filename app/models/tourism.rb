class Tourism < ApplicationRecord

  has_many :images
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  belongs_to :prefecture

  accepts_attachments_for :images, attachment: :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


# enum budget: {'1000円以下':1, '2000円以下':2,'3000円以下':3, '4000円以下':4,'5000円以下':5, '6000円以下':6,}

end
