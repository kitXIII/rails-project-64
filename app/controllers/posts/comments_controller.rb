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
      render_post
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def render_post
    @new_comment = PostComment.new
    flash.now[:error] = @comment.errors.full_messages.first
    render 'posts/show', status: :unprocessable_entity
  end

  def set_post
    @post = Post.find params[:post_id]
  end
end
