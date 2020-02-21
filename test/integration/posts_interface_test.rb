require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:sizma)
  end

  #ログイン、無効ポスト、有効ポスト、ポスト削除、他のユーザーdelete表示なし
  test "post interface" do
    log_in_as(@user)
    get root_path
    assert_select 'input[type= submit]'
    # 無効な送信
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    content = "演習場"
    image = fixture_file_upload('test/fixtures/files/images/nitinan.jpeg','image/jpeg')
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: content, image: image } }
    end
    assert_redirected_to root_url
    follow_redirect!
    get user_path(@user)
    assert_select 'h3', content: content   #<h3>
    #assert_match content,response.body    これは <body>にフィードがある前提じゃないとダメ
    # 投稿を削除する
    assert_select 'a', confirm: '本当に削除しますか？'
    first_post = @user.posts.paginate(page: 1).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    get user_path(users(:shouzou))
    assert_select 'a', text: 'delete', count: 0  # <a> delete </a>
  end
end
