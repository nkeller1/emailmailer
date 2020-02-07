require 'rails_helper'

feature 'user visits the advice page' do
  scenario 'successfully when they are logged in' do
    user = User.create(first_name: 'Nancy',
                       last_name: 'Drew',
                       email: 'nancydrew@detective.com',
                       password: 'test123')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit advice_path

    expect(current_path).to eq(advice_path)
    expect(page).to have_content('Please send a bit of advice to your friend.')
  end

  scenario 'unsuccessfully when they are not logged in' do
    visit advice_path

    expect(current_path).to eq(root_path)
  end
end
