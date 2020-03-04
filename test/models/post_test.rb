require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:sizma)
    @post = @user.posts.build(title: "なぜ自衛隊に入ったのか", content:"実は")
    #@post = Post.new(content: "なぜ自衛隊に入ったのか", user_id: @user.id)
  end

  #正常な状態かどうか
  test "should be valid" do
    assert @post.valid?
  end

  #user_idが存在しているかどうか
  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  #contentが存在しているかどうか
  test "content should be present" do
    @post.title = " "
    assert_not @post.valid?
  end

  #DB上の最初のポストとfixtureのポストが一致するか
  test "order should be most present first" do
    assert_equal posts(:most_recent), Post.first
  end
end
