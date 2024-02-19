# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true

  devise :database_authenticatable, :registerable, :rememberable, :validatable
end