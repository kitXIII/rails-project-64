# frozen_string_literal: true

class Post < ApplicationRecord
  MIN_TITLE_LENGTH = 5
  MAX_TITLE_LENGTH = 250

  MIN_BODY_LENGTH = 200
  MAX_BODY_LENGTH = 400

  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: 'posts'

  validates :title, presence: true, length: { minimum: MIN_TITLE_LENGTH, maximum: MAX_TITLE_LENGTH }
  validates :body, presence: true, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }
end
