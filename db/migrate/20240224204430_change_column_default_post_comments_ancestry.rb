class ChangeColumnDefaultPostCommentsAncestry < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:post_comments, :ancestry, from: nil, to: '/')
  end
end
