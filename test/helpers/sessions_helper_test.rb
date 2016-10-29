require 'test_helper'
class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:lesley)
    remember(@user)
  end
end
