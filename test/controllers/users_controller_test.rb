require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lesley)
  end
  test "should get new" do
    log_in_as(@user)
    get new_user_path
    assert_response :success
  end

  test "should get show" do
    log_in_as(@user)
    get user_path(@user)
    assert_response :success
  end

end
