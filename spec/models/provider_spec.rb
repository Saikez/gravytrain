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

    it 'is valid with valid attributes' do
      expect(provider).to be_valid
    end

    it 'expects the terms to be accepted' do
      provider.accepted_terms = '0'

      expect(provider).to_not be_valid
    end

    describe 'doesn\'t allow nil values' do
      it 'name cannot be nil' do
        provider.name = nil

        expect(provider).to_not be_valid
      end

      it 'address cannot be nil' do
        provider.address = nil

        expect(provider).to_not be_valid
      end

      it 'postcode cannot be nil' do
        provider.postcode = nil

        expect(provider).to_not be_valid
      end

      it 'about_me cannot be nil' do
        provider.about_me = nil

        expect(provider).to_not be_valid
      end

      it 'paypal email cannot be nil' do
        provider.paypal_email = nil

        expect(provider).to_not be_valid
      end
    end

    it 'doesn\'t allow incorrectly foramtted emails' do
      provider.paypal_email = 'hello.hi'

      expect(provider).to_not be_valid
    end

    it 'checks that the email hasn\'t already been registered' do
      Provider.create!(
          name: 'someone',
          address: 'someplace',
          postcode: 'something',
          about_me: 'somehow',
          paypal_email: 'this@that.thing',
          accepted_terms: '1'
        )

      expect(provider).to_not be_valid
    end
  end
end
