# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :post, counter_cache: :likes_count, inverse_of: 'likes'
  belongs_to :user, inverse_of: 'likes'

  validates :post, uniqueness: { scope: :user }
end
