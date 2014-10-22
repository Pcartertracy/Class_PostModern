class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :sb_id
      t.text :body

      t.timestamps
    end
    add_index :posts, :sb_id
  end
end
