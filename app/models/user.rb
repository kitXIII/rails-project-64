# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, inverse_of: 'creator', dependent: :destroy
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    presence: true,
                    uniqueness: { case_sensitive: false }

  def liked?(post)
    liked_posts.include?(post)
  end

  def like_for(post)
    likes.find_by(post:)
  end
end
