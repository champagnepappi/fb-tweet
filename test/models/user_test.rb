require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(f_name: "Cutie",l_name: "Pie", email: "elsy@gmail.com",
                     password: "justme",password_confirmation: "justme")
  end

  test "authenticated? should return false if digest is nil" do
    assert_not @user.authenticated?(:remember, '')
  end
end
