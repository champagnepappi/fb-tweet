require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lesley)
    ActionMailer::Base.deliveries.clear
  end
  test "signup with invalid information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          f_name: "",
          l_name: "",
          email: "santos@gmail.com",
          password: "",
          password_confirmation: ""
        }
      }
    end
    assert_template 'users/new'
  end

  test "signup with valid information with account activation" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          f_name: "albert",
          l_name: "einstein",
          email: "aeinstein@gmail.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # assert_redirected_to User.last
    # login before activation
    log_in_as(user)
    assert_not is_logged_in?
    #invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    #valid token wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    #valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
