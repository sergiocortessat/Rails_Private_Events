require 'rails_helper'

RSpec.describe 'Create Event', type: :system do
  let(:user) do
    User.create(name: 'testinguser', email: 'testuser@email.com', password: '123456',
                password_confirmation: '123456')
  end
  before do
    driven_by(:rack_test)
  end

  it 'Create new event' do
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit new_event_path
    fill_in 'event[description]', with: 'Test Event Description'
    fill_in 'event[date]', with: Date.parse('2024-02-22')
    click_button 'Create Event'
    expect(page).to have_text('Your event has been created')
  end

  it 'Fail to create new event' do
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit new_event_path
    fill_in 'event[description]', with: 'testingevent'
    click_button 'Create Event'
    expect(page).to have_text('Your event was not created')
  end
end
