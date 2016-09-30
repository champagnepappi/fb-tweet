require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
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
end
