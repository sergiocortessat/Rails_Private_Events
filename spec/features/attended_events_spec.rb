require 'rails_helper'

RSpec.describe 'Attend Event', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Attend new event' do
    user1 = User.create(name: 'testing user1', email: 'testuser@email.com', password: '123456',
                        password_confirmation: '123456')
    user2 = User.create(name: 'testing user2', email: 'testuser2@email.com', password: '123456',
                        password_confirmation: '123456')
    Event.create(description: 'Test even description 1', date: Date.parse('2022-04-23'), creator_id: user2.id)
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit events_path
    click_link 'Show'
    click_button 'Attend'
    expect(page).to have_text('You are now attending this event')
  end

  it 'Attend new event' do
    user1 = User.create(name: 'testing user1', email: 'testuser@email.com', password: '123456',
                        password_confirmation: '123456')
    Event.create(description: 'Test even description 1', date: Date.parse('2022-04-23'), creator_id: user1.id)
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    visit events_path
    click_link 'Show'
    click_button 'Attend'
    expect(page).to have_text('You are already attending this event')
  end
end
