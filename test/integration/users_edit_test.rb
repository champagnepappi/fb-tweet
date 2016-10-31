require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lesley)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        f_name: "Brad",
        l_name: "",
        password: "",
        password_confirmation: ""
      }
    }
    assert_template 'users/edit'
  end
end
