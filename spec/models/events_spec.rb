require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
  subject do
    described_class.new(description: 'JS Conf',
                        date: '1/1/2020',
                        creator_id: 1)
  end

  it 'ensures description presence' do
    expect(subject).to be_invalid
  end

  context 'description validation' do
    it 'ensures description presence' do
      u = User.new(name: 'ari', email: 'ngani@gmail.com', password: '123456', password_confirmation: '123456')
      u.save
      expect(Event.new(description: 'Angular Clan', date: '1/1/2020', creator_id: u.id)).to be_valid
    end
  end
  context 'description validation' do
    it 'ensures description presence' do
      expect(Event.new).to be_invalid
    end
  end

  context 'description validation' do
    it 'ensures description presence' do
      expect(Event.new(description: 'Big Bang Theory')).to be_invalid
    end
  end

  describe 'Associations' do
    it { should belong_to(:creator) }
    it { should have_many(:attendees) }
    it { should have_many(:invitations) }
  end
end
