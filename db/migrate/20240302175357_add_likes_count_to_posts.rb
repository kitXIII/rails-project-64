class AddLikesCountToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :likes_count, :integer, default: 0

    Post.all.each do |post|
      Post.reset_counters(post.id, :likes_count)
    end
  end
end
