require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:sizma)
  end

  #profile画面にアクセス後ページタイトルユーザー名、イメージ、ポスト投稿数が作動するかをテスト
  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'div.image>div.image_tag'
  end
end
