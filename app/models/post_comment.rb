# frozen_string_literal: true

class PostComment < ApplicationRecord
  MIN_CONTENT_LENGTH = 2
  MAX_CONTENT_LENGTH = 400

  belongs_to :post
  belongs_to :user

  has_ancestry

  default_scope { order(created_at: :desc) }

  validates :content, presence: true, length: { minimum: MIN_CONTENT_LENGTH, maximum: MAX_CONTENT_LENGTH }
  validate :correct_parent_post
  def correct_parent_post
    errors.add(:parent_id, :invalid_parent) if has_parent? && parent.post != post
  end
end
