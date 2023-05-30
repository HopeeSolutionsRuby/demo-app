require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'User', type: :feature do
  describe 'search' do
    context 'when search with valid input' do
      let(:admin) { build(:admin, email: 'anvu523@gmail.com', phone: 12345678900) }
      before(:each) do
        admin.save!
      end
    end

    it 'fills in the search field' do
      visit administrator_admins_url
      find('#search', wait: 10).set('An')
      click_button 'Search'

      expect(page).to have_content('An')
    end

    it 'displays no results if no matching products' do
      visit administrator_admins_url
      find('#search', wait: 10).set('An')
      click_button 'Search'

      admins = all('.admin')
      expect(admins.count).to eq(Admin.count)
    end
  end
end