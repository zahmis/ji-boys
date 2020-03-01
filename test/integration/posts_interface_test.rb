require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sizma)
  end

  test "post interface" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a', confirm: '本当に削除しますか？'
    first_post = @user.posts.paginate(page:1).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
  end
end
