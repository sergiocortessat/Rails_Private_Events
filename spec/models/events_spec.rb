require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
  subject do
    described_class.new(description: 'JS Conf',
                        date: DateTime.now,
                        creator_id: 1)
  end

  it 'ensures description presence' do
    expect(subject).to be_invalid
  end
end