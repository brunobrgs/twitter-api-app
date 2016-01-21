require 'rails_helper'

feature 'Authentication' do
  before do
    FactoryGirl.create(:user)
  end

  scenario 'Sign up' do
    visit root_path

    click_link 'Sign up'

    expect(page).to_not have_link 'Log out'
    expect(page).to_not have_button 'Sign in'

    fill_in 'Email', with: 'email1@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'

    click_button 'Sign up'

    expect(page).to have_link 'Log out'
  end

  scenario 'Log In / Log Out' do
    visit root_path

    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'user123456'

    expect(page).to_not have_link 'Log out'
    click_button 'Sign in'
    expect(page).to_not have_button 'Log in'
    click_link 'Log out'
    expect(page).to_not have_link 'Log out'
    expect(page).to have_button 'Sign in'
  end
end
