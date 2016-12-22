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
    # assert_redirected_to User.last
  end
end
