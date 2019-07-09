require 'test_helper'

class GameShareControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get game_share_home_url
    assert_response :success
  end

  test "should get help" do
    get game_share_help_url
    assert_response :success
  end

end
