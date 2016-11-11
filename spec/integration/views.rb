require 'rails_helper'

describe 'titles' do
  it "should have page title" do
    visit('/')
    page.should have_selector("title", text: "FbTweet")
  end
end
