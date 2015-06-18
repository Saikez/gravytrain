class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.create(provider_params)

    if @provider.valid?
      ProvidersMailer.register(@provider).deliver_later
      redirect_to @provider
    else
      render :new
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  private

  def provider_params
    params.require(:provider).permit(
      :name, :address, :postcode, :about_me, :paypal_email, :accepted_terms
    )
  end
end
