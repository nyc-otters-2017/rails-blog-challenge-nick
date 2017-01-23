class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null:false, limit: 100
      t.string :content, null:false, limit: 1000
      t.string :img_src
      t.integer :user_id

      t.timestamps(null: false)
    end
  end
end
