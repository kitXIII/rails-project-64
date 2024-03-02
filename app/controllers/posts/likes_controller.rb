# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  def create
    like = PostLike.new(user: current_user, post: resource_post)

    notification =
      if like.save
        {}
      else
        { alert: like.errors.full_messages.to_sentence }
      end

    redirect_to resource_post, notification
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id])

    notification =
      if like && !like.destroy!
        { alert: like.errors.full_messages.to_sentence }
      else
        {}
      end

    redirect_to resource_post, notification
  end
end
