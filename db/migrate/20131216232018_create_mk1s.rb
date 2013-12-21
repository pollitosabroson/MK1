class CreateMk1s < ActiveRecord::Migration
  def change
    create_table :mk1s do |t|
      t.string :instagram_id
      t.string :instagram_link
      t.string :pic_thumb
      t.string :pic_med
      t.string :pic_large
      t.string :fullname
      t.string :username
      t.boolean :publicado, :default => false
      t.integer :visit

      t.timestamps
    end
  end
end
