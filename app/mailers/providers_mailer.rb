class ProvidersMailer < ActionMailer::Base
  def register(provider)
    @provider = provider

    mail to: provider.paypal_email,
      from: 'noreply@gravytrain.com',
      subject: 'Thanks for registering'
  end
end
