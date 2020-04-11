require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sizma)
    @other_user = users(:shouzou)
  end

  #新規作成ページをgetする
  test "should get new" do
    get signup_path
    assert_response :success
  end

  #不適切なUserとしてログインしたときeditをリダイレクトする。
  test "should redirect edit when logged in as wrong user" do
    log_in_as @other_user
    get edit_user_path @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  #不適切なUserとしてログインしたときupdateをリダイレクトする。
  test "should redirect update when logged in as wrong user" do
    log_in_as @other_user
    patch user_path @user, params: {user: {
                                     name: @user.name,
                                     email: @user.email}}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  #ログインしていないときにindexページをリダイレクトする
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  #ログインしていないときにupdateページをリダイレクトする
  test "should redirect update when not logged in" do
    patch user_path @user, params: {user: {
                                     name: @user.name,
                                     email: @user.email}}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  #web経由で編集されることを禁止する
  test "should not allow the admin attribute to be edited via the web" do
    log_in_as @other_user
    assert_not @other_user.admin?
    patch user_path @other_user, params:{ user: {
                                           password: @other_user.password,
                                           password_confirmation: @other_user.password,
                                           admin: true}}
    assert_not @other_user.reload.admin?
   end

    #ログインしていないときにdestroyをリダイレクトする
    test "should redirect destroy when not logged in" do
      assert_no_difference 'User.count' do
        delete user_path @user
      end
      assert_redirected_to login_url
    end

    #非管理者（一般ユーザー）でログインしているときにdestroyをリダイレクトする
    test "should redirect destroy when logged in as a non-admin" do
      log_in_as @other_user
      assert_no_difference 'User.count' do
        delete user_path @user
      end
      assert_redirected_to login_url
    end
end
