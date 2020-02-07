require 'rails_helper'

feature 'user visits the advice page' do
  context 'successfully' do
    before(:each) do
      user = User.create(first_name: 'Nancy',
                         last_name: 'Drew',
                         email: 'nancydrew@detective.com',
                         password: 'test123')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit advice_path
    end

    scenario 'successfully when they are logged in' do
      expect(current_path).to eq(advice_path)
      expect(page).to have_content('Please send a bit of advice to your friend.')
    end

    scenario 'and can fill out form to send advice to friend' do
      fill_in :friends_name, with: 'Leroy Brown'
      fill_in :friends_email, with: "encylopediabrown@detective.com"
      click_on 'Send Advice'

      expect(current_path).to eq(advice_path)
      expect(page).to have_content("Thank you for sending a bit of advice.")
    end
  end

  context 'unsuccessfully' do
    scenario 'when they are not logged in' do
      visit advice_path

      expect(current_path).to eq(root_path)
    end
  end
end
