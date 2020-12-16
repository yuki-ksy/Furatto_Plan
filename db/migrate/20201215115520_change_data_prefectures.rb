class ChangeDataPrefectures < ActiveRecord::Migration[5.2]
  def change
    add_column :prefectures, :prefecture, :integer
    remove_column :prefectures, :name, :string
  end
end
