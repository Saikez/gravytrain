require 'rails_helper'

RSpec.describe Provider do
  describe 'validation' do
    let(:provider) do
      provider = Provider.new(
        name: 'Ben',
        address: '10',
        postcode: 'bas',
        about_me: 'hi',
        paypal_email: 'this@that.thing',
        accepted_terms: '1'
      )
    end

    let(:provider2) do
      provider2 = Provider.new(accepted_terms: '1')
    end

    it 'is valid with valid attributes' do
      expect(provider).to be_valid
    end

    it 'expects the terms to be accepted' do
      provider.accepted_terms = '0'

      expect(provider).to_not be_valid
    end

    it 'doesn\'t allow nil values' do
      expect(provider2).to_not be_valid
    end
  end
end
