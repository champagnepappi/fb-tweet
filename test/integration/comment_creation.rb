require 'test_helper'

class CommentCreationTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:lesley)
  end
end
