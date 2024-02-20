# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: 'posts'

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { minimum: 200, maximum: 4000 }
end
