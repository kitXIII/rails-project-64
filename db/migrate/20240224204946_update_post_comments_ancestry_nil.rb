class UpdatePostCommentsAncestryNil < ActiveRecord::Migration[7.1]
  def up
    PostComment.where(ancestry: nil).update_all("ancestry='/'")
  end

  def down
    PostComment.where(ancestry: '/').update_all("ancestry=null")
  end
end
