class CreateCommnets < ActiveRecord::Migration
  def change
    create_table :commnets do |t|
      t.integer :padre
      t.text :comentario
      t.boolean :publicado, :default => true
      t.integer :post_id
      t.integer :positive
      t.integer :negative

      t.timestamps
    end
  end
end
