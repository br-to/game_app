require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post micropost_create_url
    assert_response :success
  end

  test "should get destroy" do
    delete comments_destroy_url
    assert_response :success
  end

end
