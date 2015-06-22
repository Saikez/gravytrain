Given(/^no Providers exist$/) do
  expect(Provider.count).to eq(0)
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
  expect(page).to have_content('Provider Profile ( Simon )')
end

Then(/^my account is unconfirmed$/) do
  expect(Provider.first).to_not be_confirmed
end

Then(/^I receive a confirmation email$/) do
  expect(ActionMailer::Base.deliveries).to_not be_empty
end


When(/^I do not check the Accepted terms checkbox$/) do
  uncheck 'Accepted terms'
end

Then(/^my Provider account is not created$/) do
  expect(Provider.count).to eq(0)
end

Then(/^I see an error message$/) do
  expect(page).to have_content('must be accepted')
end

Given(/^I have registered$/) do
  @provider = Provider.create!(
      name: 'Simon',
      address: '10 Pie Lane',
      postcode: 'YG8 BUJB',
      about_me: 'LOL',
      paypal_email: 'dan@dan.dan',
      accepted_terms: '1'
    )
end

When(/^I follow the link within my confirmation email$/) do
  visit(confirm_provider_url(@provider, token: @provider.token))
end

Then(/^my account is confirmed$/) do
  expect(Provider.first).to be_confirmed
end

Then(/^I am directed to my profile$/) do
  expect(page).to have_content(@provider.name)
end

Given(/^my Provider profile exists$/) do
  @provider = Provider.create!(
      name: 'Simon',
      address: '10 Pie Lane',
      postcode: 'YG8 BUJB',
      about_me: 'LOL',
      paypal_email: 'dan@dan.dan',
      accepted_terms: '1'
    )
end

When(/^I am on my provider profile page$/) do
  visit provider_path(@provider)
end

Then(/^I see my details$/) do
  expect(page).to have_content(@provider.name)
end

Given(/^a registered provider with events$/) do
  @provider = Provider.create!(
      name: 'Simon',
      address: '10 Pie Lane',
      postcode: 'YG8 BUJB',
      about_me: 'LOL',
      paypal_email: 'dan@dan.dan',
      accepted_terms: '1'
    )

  @provider.events = [Event.create!(
    name: 'Cool Event'
    )]
end

When(/^I view the provider's events$/) do
  visit provider_events_path(@provider, @provider.events.first)
end

Then(/^I see a list of events offered by the provider$/) do
  expect(page).to have_content(@provider.events.first.name)
end
