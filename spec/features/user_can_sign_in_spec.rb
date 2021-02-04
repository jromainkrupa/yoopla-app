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

    expect(page).to have_current_path(/.set_status_form/)
    expect(user.status).to eq(nil)
  end

  scenario 'as a mentor is redirect to invite a friend' do
    mentor_user = create(:mentor_user)
    sign_in_as(mentor_user)

    expect(page).to have_current_path(/.invite_a_friend/)
  end

  scenario 'as ready_to_start is redirect to get ready' do
    ready_user = create(:ready_to_start_user)
    program    = create(:program, user: ready_user)

    sign_in_as(ready_user)

    expect(page).to have_current_path(/.get_ready/)
  end

  scenario 'as in_program is redirect to dashboard' do
    user    = create(:in_program_user)
    program = create(:program_started, user: user)

    sign_in_as(user)

    expect(page).to have_current_path(/.dashboard/)
  end
end
