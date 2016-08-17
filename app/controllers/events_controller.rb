class EventsController < ApplicationController
  def index
    @events = Event.where(status: 0)
  end

  def unavailable
    @events = Event.where(status: 1)
  end

  def show
    @event = Event.find_by(slug: params[:title])
  end
end
