require 'rails_helper'

feature 'Sign_in User' do

  scenario 'with valid inputs' do
    user = create(:user)

    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'commit'

    expect(page).to have_content('mentor')
    expect(user.status).to eq(nil)
  end
end
