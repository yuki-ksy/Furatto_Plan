class CreateTourisms < ActiveRecord::Migration[5.2]
  def change
    create_table :tourisms do |t|
      t.integer :user_id
      t.integer :genre_id
      t.integer :prefecture_id
      t.string :name
      t.text :production
      t.integer :budget
      t.float :latitude
      t.float :longitude
      t.text :address

      t.timestamps
    end
  end
end
