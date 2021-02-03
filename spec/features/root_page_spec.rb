require 'rails_helper'

describe 'landing', type: :system do
  describe 'home page' do
    it 'shows a sign_up button' do
      visit root_path
      expect(page).to have_content('S\'inscrire')
    end
    it 'show a sign_in button' do
      visit root_path
      expect(page).to have_content('Se connecter')
    end
  end
end
