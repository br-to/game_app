require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should post create" do
    post micropost_create_url
    assert_response :success
  end

  test "should delete destroy" do
    delete comments_destroy_url
    assert_response :success
  end

end
