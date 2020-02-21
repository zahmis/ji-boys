require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:orange)
  end
  #createアクションはログイン済みの必要あり
  #ログインしていないときは　createアクションをリダイレクトする（ログインURLに戻す）
  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: {post: {content: "Lorem"}}
    end
    assert_redirected_to login_url
  end

  #ログインしていないとき、destroyアクションをリダイレクトする
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
  end

  #他のユーザーがポストを削除しようとすると適切にリダイレくとする
    test "should redirect destroy for wrong post" do
      log_in_as(users(:sizma))
      post = posts(:ants)
      assert_no_difference 'Post.count' do
        delete post_path(post)
      end
      assert_redirected_to root_url
    end
end
