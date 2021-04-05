require 'rails_helper'

RSpec.describe 'UserSignIns', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'signs up with valid data' do
    visit root_path
    click_link_or_button 'Sign up'
    fill_in 'user[name]', with: 'testing'
    fill_in 'user[email]', with: 'testing@gmail.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_button 'Sign up'
    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it 'signs in invalid user' do
    visit root_path
    click_link_or_button 'Sign up'
    fill_in 'user[name]', with: 'testing'
    fill_in 'user[email]', with: 'testing@gmail.com'
    click_button 'Sign up'
    expect(page).to have_text("Events\nSign up Sign in\nSign up\n1 error prohibited this user from being saved:\nPassword can't be blank\nName testing\nEmail\nPassword\n(6 characters minimum)\nPassword confirmation\nLog in")
  end
end
