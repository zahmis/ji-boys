require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sizma)
  end

  #editが成功しないときの動作をテストする
  test "unsuccessful edit" do
    log_in_as @user
    get edit_user_path @user
    assert_template 'users/edit'
    patch user_path @user, params: { user: { name: "",
                                     email: "foo@invalid",
                                     password: "foo",
                                     password_confrimation: "bar",
                                     image: "kdikslk"} }
    assert_template 'users/edit'
  end

  #editが成功したときの動作をテストする
  test "successful edit" do
    log_in_as @user
    get edit_user_path @user
    assert_template 'users/edit'
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path @user, params: {user: {
                                     name: name,
                                    email: email,
                                    password: "",
                                    password_confrimation: "",
                                    image: "nitinan.jpeg" }}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
    end

    #ログインしていないときはeditをリダイレクトする
    test "should redirect edit when not logged in" do
      get edit_user_path @user
      assert_not flash.empty?
      assert_redirected_to login_url
    end

    #ログインしていないときはupdateをリダイレクトする
    test "should redirect update when not logged in" do
      patch user_path @user, params: { user: {
                                        name: @user.name,
                                        email: @user.email }}
      assert_not flash.empty?
      assert_redirected_to login_url
    end

    #フレンドリーフォワーディングで編集に成功したときの動作
    test "successful edit with friendly forwarding" do
      get edit_user_path @user
      log_in_as @user
      assert_redirected_to edit_user_url @user
      assert_nil session[:forwarding_url]
      name = "Foo Bar"
      email = "foo@bar.com"
      patch user_path @user, params: {user:{
                                       name: name,
                                       email:email,
                                       password: "",
                                       password_confrimation: ""}}
      assert_not flash.empty?
      assert_redirected_to @user
      @user.reload
      assert_equal name, @user.name
      assert_equal email, @user.email
    end
end
