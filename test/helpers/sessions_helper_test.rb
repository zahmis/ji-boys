require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:sizma)
    remember(@user)
  end

  #セッションがnilの時current_userを正しいユーザーとするテスト
  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  #remember digestがnilの時current_userがnilを返すテスト
  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end
