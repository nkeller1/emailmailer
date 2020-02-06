require 'rails_helper'

feature 'user can visit welcome page' do
  scenario 'when visiting the root path' do
    visit root_path

    expect(current_path).to eq (root_path)
    expect(page).to have_content('Welcome to a bit of advice!')
  end
end
