class Tourism < ApplicationRecord
  has_many :images
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  belongs_to :prefecture

  accepts_attachments_for :images, attachment: :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true
  validates :production, presence: true
  validates :prefecture, presence: true
  validates :genre, presence: true
  validates :budget, presence: true
  validates :address, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
