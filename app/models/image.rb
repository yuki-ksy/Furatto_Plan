class Image < ApplicationRecord
  belongs_to :tourism
  attachment :image
end
