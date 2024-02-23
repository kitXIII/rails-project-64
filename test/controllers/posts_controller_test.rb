# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @category = categories(:one)

    @attrs = {
      title: Faker::Lorem.paragraph_by_chars(number: 10),
      body: Faker::Lorem.paragraph_by_chars(number: 256),
      category_id: @category.id
    }
  end

  test 'should get index for unauthorized user' do
    get root_url

    assert_response :success
  end

  test 'should get index for authorized user' do
    sign_in(@user)
    get root_url

    assert_response :success
  end

  test 'should not get new for unauthorized user' do
    get new_post_url

    assert_redirected_to new_user_session_path
  end

  test 'should get new for authorized user' do
    sign_in(@user)
    get new_post_url

    assert_response :success
  end

  test 'should not create post for unauthorized user' do
    post posts_url, params: { post: @attrs }

    assert_redirected_to new_user_session_path
  end

  test 'should create post for authorized user' do
    sign_in(@user)
    post posts_url, params: { post: @attrs }

    post = Post.find_by @attrs

    assert post
    assert_equal post.creator, @user
    assert_redirected_to post_url(post)
  end

  test 'should get show for unauthorized user' do
    get post_url(@post)

    assert_response :success
  end

  test 'should get show for authorized user' do
    sign_in(@user)
    get post_url(@post)

    assert_response :success
  end
end
