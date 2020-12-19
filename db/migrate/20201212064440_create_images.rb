class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :tourism_id
      t.string :image_id

      t.timestamps
    end
      add_index :images, [:tourism_id]
  end
end
