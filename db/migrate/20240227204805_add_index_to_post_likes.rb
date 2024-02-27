class AddIndexToPostLikes < ActiveRecord::Migration[7.1]
  def change
    add_index :post_likes, [:post_id, :user_id], unique: true
  end
end
