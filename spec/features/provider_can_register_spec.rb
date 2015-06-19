require 'rails_helper'

RSpec.feature 'Provider can register' do
  before do
    visit new_provider_path

    fill_in 'Name', with: 'Dave'
    fill_in 'Address', with: '10 Pie Lane'
    fill_in 'Postcode', with: 'RGL 83J'
    fill_in 'About me', with: 'I am best!'
    fill_in 'Paypal email', with: 'a@ba.ca'
  end

  scenario 'A provider account is created' do
    check 'Accepted terms'

    expect { click_button 'Create Provider' }.to change { Provider.count }.by(1)

    # binding.pry
    expect(Provider.first).to_not be_confirmed
    # expect(Provider.first.confirmed).to eq(false)
  end

  scenario 'A provider does not accept the Accetped terms' do
    uncheck 'Accepted terms'

    expect { click_button 'Create Provider' }.not_to change { Provider.count }
  end
end
