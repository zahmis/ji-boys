require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "sizma",
                     email: "med829ratteru86@gmail.com",
                     password: "foobar",
                     password_confirmation: "foobar",
                     image: "nitinan.jpeg")
  end

  #　@userが有効かどうかをテスト
  test "should be valid" do
    assert @user.valid?
  end

  #@userが存在するかをテスト
  test "should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  #emailgが存在するかをテスト
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  #名前が長すぎないかをテスト
  test "name should not be too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  #emailが長すぎないかをテスト
  test "email should not be too long" do
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end

  #emailの決まりが適切なアドレスを受け取れるかをテスト
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  #emailのアドレスが一意に決まるかをテスト
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  #emailのアドレスが小文字として保存されるかをテスト
  test "email address should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  #パスワードが存在するかをテスト
  test "password should be present(nonblank)" do
    @user.password = @user.password_confirmation = " "*6
    assert_not @user.valid?
  end

  #パスワードが最小の長さを満たすかをテスト
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end

  #ユーザーがnil digestの状態の時、認証がfalseで返されることをテスト
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
