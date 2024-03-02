# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_ancestry

  scope :ordered_by_created_at, -> { order(created_at: :desc) }

  validates :content, presence: true, length: { minimum: 2, maximum: 400 }
  validate :correct_parent_post

  private

  def correct_parent_post
    errors.add(:parent_id, :invalid_parent) if has_parent? && parent.post != post
  end
end
