class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.create(provider_params)
    redirect_to @provider
  end

  def show
    render text: 'Done!'
  end

  private

  def provider_params
    params.require(:provider).permit(
      :name, :address, :postcode, :about_me, :paypal_email, :accepted_terms
    )
  end
end
