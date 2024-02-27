# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post), notice: t('.success')
    else
      redirect_to post_path(@post), alert: @comment.errors.full_messages.first
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def set_post
    @post = Post.find params[:post_id]
  end
end
