require 'rails_helper'

RSpec.describe 'UserSignIns', type: :system do
  let(:user) { User.create(name: 'testuser', email: 'testuser@email.com', password: '123456', password_confirmation: '123456') }
  before do
    driven_by(:rack_test)
  end

  it 'signs in valid user' do
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end

  it 'signs in invalid user' do
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123457'
    click_button 'Log in'
    expect(page).not_to have_text('Signed in successfully.')
  end

  it 'sings out when signed in' do
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
    click_button 'Sign out'
    expect(page).to have_text('Signed out successfully.')
  end
end
