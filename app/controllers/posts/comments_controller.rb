# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = resource_post

    notification = { notice: t('.success') }
    notification = { alert: @comment.errors.full_messages.first } unless @comment.save

    redirect_to post_path(resource_post), notification
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
