# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  def create
    like = PostLike.new(user: current_user, post: resource_post)

    flash[:alert] = like.errors.full_messages.first unless like.save

    redirect_to(resource_post)
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id])

    flash[:alert] = like.errors.full_messages.first if like && !like.destroy!

    redirect_to(resource_post)
  end
end
