require 'rails_helper'

feature 'user can register' do
  scenario 'by inputing their info' do

    visit '/registration'

    expect(current_path).to eq(registration_path)

    fill_in :first_name, 'Nancy'
    fill_in :last_name, 'Drew'
    fill_in :email, "nancydrew@detective.com"
    fill_in :password, 'test123'
    click_on 'Submit'

    expect(current_path).to eq(advice_path)
    expect(page).to have_conent('Send a bit of advice!')
  end
end
