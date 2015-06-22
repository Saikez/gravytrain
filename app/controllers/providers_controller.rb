class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end

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

  def confirm
    if @provider = Provider.find_by(id: params[:id], token: params[:token])
      @provider.confirm
      redirect_to @provider
    else
      render text: "lulwhat?"
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  private

  def provider_params
    params.require(:provider).permit(
      :name,
      :address,
      :postcode,
      :about_me,
      :paypal_email,
      :accepted_terms,
      events_attributes: [:id, :name, :_destroy]
    )
  end
end
