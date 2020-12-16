class Genre < ApplicationRecord
  has_many :tourisms

  enum genre: {"デート"=>1,"ひとり旅"=>2,"グルメ"=>3,"観光地巡り"=>4,"ドライブ"=>5,"友達とぶらり"=>6}
end
