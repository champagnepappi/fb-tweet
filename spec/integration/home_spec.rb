require 'rails_helper'

describe 'home page' do
  context "Go to home page" do
    it 'opens homepage' do
      visit '/'
      expect(page).to have_content('Create an Account')
    end
  end
end
