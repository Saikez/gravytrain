require 'rails_helper'

RSpec.describe ProvidersMailer do
  describe '.register' do
    let(:provider) { Provider.new(name: 'Ben', paypal_email: 'ben@ben.ben') }

    # equivalent to let(:subject) {  }
    subject { ProvidersMailer.register(provider).deliver_now }

    it 'is sent to the provider' do
      expect(subject.to.first).to eq(provider.paypal_email)
    end

    it 'has a subject' do
      expect(subject.subject).to eq('Thanks for registering')
    end

    describe '#body' do
      it 'is addressed to the provider' do
        expect(subject.body.parts.first.decoded).to include(provider.name)
      end
    end
  end
end
