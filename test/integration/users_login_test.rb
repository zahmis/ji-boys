require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sizma)
  end

  #無効な情報でログインしたときのテスト
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: {email: "", password: ""}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  #有効な情報でログインしたときのテスト
  test "login with valid information" do
    get login_path
    post login_path, params: {session: {
                               email: @user.email,
                               password: 'password'}}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

    #有効な情報で新規登録したときのテスト
    test "valid signup information" do
      get signup_path
      assert_difference 'User.count', 1 do
        post users_path, params: { user: { name: "Examp;e User",
                                  email: "user@example.com",
                                  password: "password",
                                  password_confirmation: "password"}}
      end
      follow_redirect!
#      assert_template 'users/show'
#     assert is_logged_in?
    end


    test "login with valid information followed by logout" do
      get login_path
      post login_path, params: { session: { email: @user.email,
                                            password: 'password'}}
      assert is_logged_in?
      assert_redirected_to @user
      follow_redirect!
      assert_template 'users/show'
      #１つヒットすることをテストするには countでこのように書ける
      assert_select "a[href=?]", logout_path
      assert_select "a[href=?]", user_path(@user)
      delete logout_path
      assert_not is_logged_in?
      assert_redirected_to root_url
      #２番目のウインドウでログアウトをクリックするユーザーをシミュレートする
      delete logout_path
      follow_redirect!
      assert_select "a[href=?]", login_path
      #ヒットしないことをテストするには countでこのように書ける
      assert_select "a[href=?]", logout_path, count: 0
      assert_select "a[href=?]", user_path(@user), count: 0
    end

    #チェックボックスがオンのテスト
    test "login with remembering" do
      log_in_as(@user,remember_me: '1')
      assert_not_empty cookies['remember_token']
    end

    #チェックボックスがオフのテスト
    test "login without remembering" do
      #クッキーを保存してログイン
      log_in_as(@user, remember_me: '1')
      delete logout_path
      #クッキー消してログイン
      log_in_as(@user, remember_me: '0')
      assert_empty cookies['remember_token']
    end
end
