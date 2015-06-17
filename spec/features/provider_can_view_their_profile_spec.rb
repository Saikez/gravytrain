require 'rails_helper'

RSpec.feature 'Provider can view their profile' do
  before do
    @provider = Provider.create!(
        name: 'Ben',
        address: '10',
        postcode: 'bas',
        about_me: 'hi',
        paypal_email: 'this@that.thing',
        accepted_terms: '1'
      )
  end

  scenario 'Provider can see their details after submitting' do
    visit provider_path(@provider)

    expect(page.body).to include "#{@provider.name}"
    expect(page.body).to include "#{@provider.address}"
    expect(page.body).to include "#{@provider.postcode}"
    expect(page.body).to include "#{@provider.about_me}"
    expect(page.body).to include "#{@provider.paypal_email}"
  end
end
