require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Cuty Pie", email: "elsy@gmail.com",
                     password: "justme",password_confirmation: "justme")
  end
end
