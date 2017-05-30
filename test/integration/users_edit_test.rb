require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:lesley)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    # assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        f_name: "Brad",
        l_name: "",
        email: "yeah@me.com",
        password: "",
        password_confirmation: ""
      }
    }
    # assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    f_name = "mark"
    l_name = "Zuckerberg"
    email = "mark@z.com"

    patch user_path(@user), params: {
      user: {
         f_name: f_name,
         l_name: l_name,
         email: email,
         password: "",
         password_confirmation: ""
      }
    }
    assert_redirected_to @user
    assert_not flash.empty?
    assert_equal flash[:success], "Profile Successfully Updated"
    @user.reload
    assert_equal @user.f_name, f_name
    assert_equal @user.l_name, l_name
    assert_equal @user.email, email
  end
end
