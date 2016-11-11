require 'rails_helper'

describe 'page titles' do
  it "should have page title" do
    visit('/')
    page.should have_selector("title", text: "FbTweet")
  end

  it 'should signup user' do
    visit('/')
    expect(page).to have_content('Create an Account')
    click_button('Create an Account')
  end
end

