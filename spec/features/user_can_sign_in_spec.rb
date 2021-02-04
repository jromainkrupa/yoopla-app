require 'rails_helper'

feature 'Sign_in User' do

  scenario 'with invalid inputs errors appear' do
    visit new_user_session_path
    click_on 'commit'

    expect(page).to have_content('email can\'t be blank')
    expect(page).to have_content('password can\'t be blank')
  end

  scenario 'with valid inputs redirect to status' do
    user = create(:user)
    sign_in_as(user)

    expect(page).to have_content('mentor')
    expect(user.status).to eq(nil)
  end

  scenario 'a mentor is redirect to invite a friend' do
    mentor_user = create(:mentor_user)
    sign_in_as(mentor_user)



  end
end
