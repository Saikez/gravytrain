Given(/^no Providers exist$/) do
  Provider.delete_all
end

When(/^I am on the registration page$/) do
  visit new_provider_path
end

When(/^I complete the required fields$/) do
  fill_in 'Name', with: 'Simon'
  fill_in 'Address', with: '10 Pie Lane'
  fill_in 'Postcode', with: 'YG8BUJB'
  fill_in 'About me', with: 'LOL'
  fill_in 'Paypal email', with: 'ben@ben.ben'
  check 'Accepted terms'
end

When(/^I submit my information$/) do
  click_button 'Create Provider'
end

Then(/^my Provider account is created$/) do
  expect(Provider.count).to eq(1)
  expect(Provider.where(name: 'Simon')).to be
end

Then(/^I see a confirmation message$/) do
  expect(page).to have_content('Done!')
end
