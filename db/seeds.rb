# frozen_string_literal: true

categories = %w[Технологии Наука ИИ].freeze

categories.each do |name|
  Category.find_or_create_by!(name:)
end
