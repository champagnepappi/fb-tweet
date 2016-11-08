require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lesley)
  end
  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get show" do
    log_in_as(@user)
    get user_path(@user)
    assert_response :success
  end

  test "redirect user trying to edit without login in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "redirect update if not logged in" do
    patch user_path(@user), params: {
      id: @user,
      user: {
         f_name: @user.f_name,
         l_name: @user.l_name,
         email: @user.email
      }
    }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
