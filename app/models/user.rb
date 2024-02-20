# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, inverse_of: 'creator', dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    presence: true,
                    uniqueness: { case_sensitive: false }
end
