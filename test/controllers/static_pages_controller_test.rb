require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "これから自衛隊に入ることを考えている人のために"
    @user = users(:sizma)
  end

  #rootをgetする
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  #homeをgetする
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get article " do
    log_in_as(@user)
    get new_post_path
  end
end
