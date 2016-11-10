require 'rails_helper'

describe 'home page' do
  context "Go to home page" do
    it 'opens homepage' do
      visit '/'
    end
  end
end
