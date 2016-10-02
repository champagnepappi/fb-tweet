require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {
      session: {
        email: "",
        password: ''
      }
    }
    assert_template 'sessions/new'
    assert_not flash.empty?
    assert_equal flash[:danger], "Invalid email and password combination"
  end
end
