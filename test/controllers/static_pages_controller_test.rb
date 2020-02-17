require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "自衛隊に入隊したいけど不安な君へ"
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
end
