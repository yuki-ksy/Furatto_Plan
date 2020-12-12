class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :tourism_id
      t.string :image_

      t.timestamps
    end
  end
end
