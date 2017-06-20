require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @common_title = "| FbTweet"
  end
  test "should get home" do
    get root_path
    assert_response :success
    assert_select 'title', "Home #{@common_title}"
    assert_select "a[href=?]", login_path
  end

end
