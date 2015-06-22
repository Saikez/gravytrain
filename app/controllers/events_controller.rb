class EventsController < ApplicationController
  def index
    if @provider = Provider.find(params[:provider_id])
      @events = @provider.events
    else
      render text: 'No events found!'
    end
  end

  def show
    if @event = Event.find_by(id: params[:id], provider_id: params[:provider_id])
      if @provider = Provider.find_by(id: params[:provider_id])
        render :show
      else
        render text: 'It seems that your provider doesn\'t exist anymore..?'
      end
    else
      render text: 'This is not the event you are looking for...'
    end
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
