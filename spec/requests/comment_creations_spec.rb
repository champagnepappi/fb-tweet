require 'rails_helper'

RSpec.describe "CommentCreations", type: :request do
  describe "GET /comment_creations" do
    it "works! (now write some real specs)" do
      get comment_creations_path
      expect(response).to have_http_status(200)
    end
  end
end
