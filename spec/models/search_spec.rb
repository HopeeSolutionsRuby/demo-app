require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'User', type: :feature do
  describe 'search' do
    let(:admin) { create(:admin, email: 'anvu523@gmail.com', phone: '12345678900') }
    
    before do
      admin.save!
    end

    it 'fills in the search field' do
      visit 'http://127.0.0.1:3001/administrator/admins'
      find("#search").set('thien')
      click_button 'Search'
      expect(page).to have_content('An')
    end

    it 'displays no results if no matching products' do
      visit 'http://127.0.0.1:3001/administrator/admins'
      fill_in 'search', with: ''
      click_button 'Search'
      expect(page).to have_content('No results')
    end
  end
end
