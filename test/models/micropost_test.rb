require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum",title: "Rockman")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 150 characters" do
    @micropost.content = "a" * 151
    assert_not @micropost.valid?
  end

  test "title should be present" do
    @micropost.title ="  "
    assert_not @micropost.valid?
  end

  test "title should be at most 30 characters" do
    @micropost.title = "a" * 31
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
