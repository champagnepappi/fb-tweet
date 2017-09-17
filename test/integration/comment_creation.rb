require 'test_helper'

class CommentCreationTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:lesley)
  end
  
  test "test successful comment creation" do
    log_in_as(@user)
    assert_difference 'Comment.count' do
      post comments_path, params: {
        comment: {
          content: "hioufhsiohfsoihshso"

        }
      }
      
    end
  end

end
