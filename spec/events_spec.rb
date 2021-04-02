require 'rails_helper'

RSpec.describe 'Events', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit events_index_path
      expect(page).to have_content('Welcome')
    end
  end
end