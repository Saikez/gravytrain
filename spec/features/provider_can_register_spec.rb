require 'rails_helper'

RSpec.feature 'Provider can register' do
  scenario 'A provider account is created' do
    visit new_provider_path

    fill_in 'Name', with: 'Dave'
    fill_in 'Address', with: '10 Pie Lane'
    fill_in 'Postcode', with: 'RGL 83J'
    fill_in 'About me', with: 'I am best!'
    fill_in 'Paypal email', with: 'a@ba.ca'
    check 'Accepted terms'

    expect { click_button 'Create Provider' }.to change { Provider.count }.by(1)
  end

  scenario 'A provider does not accept the Accetped terms' do
    visit new_provider_path

    fill_in 'Name', with: 'Dave'
    fill_in 'Address', with: '10 Pie Lane'
    fill_in 'Postcode', with: 'RGL 83J'
    fill_in 'About me', with: 'I am best!'
    fill_in 'Paypal email', with: 'a@ba.ca'
    uncheck 'Accepted terms'

    expect { click_button 'Create Provider' }.not_to change { Provider.count }
  end
end
