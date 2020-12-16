class Tourism < ApplicationRecord

  has_many :images
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  belongs_to :prefecture

  accepts_attachments_for :images, attachment: :image
end
