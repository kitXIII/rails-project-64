# frozen_string_literal: true

module PostsHelper
  def min_length_of_field(field)
    length_validator_options_for(field)[:minimum]
  end

  def max_length_of_field(field)
    length_validator_options_for(field)[:maximum]
  end

  def length_validator_options_for(field)
    validator = Post.validators_on(field.to_sym).find { |v| v.kind == :length }
    validator ? validator.options : {}
  end
end
