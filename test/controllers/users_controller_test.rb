require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lesley)
    @user2 = users(:dephney)
  end
  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get show" do
    log_in_as(@user)
    assert_redirected_to @user
    assert_response :success
  end

  test "redirect user trying to edit without login in" do
    get edit_user_path(@user), params: {id: @user}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit for wrong user" do
    log_in_as(@user2)
    get edit_user_path(@user), params: {id: @user}
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

  test "redirect update when wrong user logs in" do
    log_in_as(@user2)
    patch user_path(@user), params: {
      user: {
        f_name: @user.f_name,
        email: @user.email
      }
    }
    assert_redirected_to login_path
  end

end
