require 'rails_helper'

describe 'home page' do
  context "Go to home page" do
    it 'opens homepage' do
      visit '/'
      expect(page).to have_content('Create an Account')
    end
  end
end

# describe 'signup process' do
#   it "signup user with valid credentials" do
#     visit(new_user_path)
#     page.fill_in "First name", with: "Donald"
#     page.fill_in "Last name", with: "Trump"
#     page.fill_in "email", with: "don@gmail.com"
#     page.fill_in "Password", with: "pass"
#     page.fill_in "Password confirmation", with: "pass"
#     click_button('Create an Account')
#     page.should_content("Welcome to FbTweet")
#   end
# end
#
describe 'sign in process' do
  before :each do
    User.create(email: "somebody@gmail.com", password: 'password')
  end

  it 'signs me in' do
    visit '/login'
      fill_in 'Email', with: 'somebody@gmail.com'
      fill_in 'Password', with: 'password'
    click_button 'Submit'
  end
end
