require 'rails_helper'

feature 'user can register' do
  scenario 'successfully by inputing their info' do

    visit '/registration'

    expect(current_path).to eq(registration_path)

    fill_in :user_first_name, with: 'Nancy'
    fill_in :user_last_name, with: 'Drew'
    fill_in :user_email, with: "nancydrew@detective.com"
    fill_in :user_password, with: 'test123'
    click_on 'Submit'

    expect(current_path).to eq(advice_path)
    expect(page).to have_conent('Send a bit of advice!')
  end
  scenario 'unsuccessfully by not inputting info' do

    visit '/registration'

    expect(current_path).to eq(registration_path)

    click_on 'Submit'

    expect(current_path).to eq(registration_path)
    expect(page).to have_content('Something went wrong, please try again.')
  end

end
