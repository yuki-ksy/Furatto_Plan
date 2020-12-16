class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tourisms
  has_many :comments, dependent: :destroy

  attachment :profile_image



  enum gender: {男性:1, 女性:2}
end
