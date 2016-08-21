class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:edit, :update]
  before_action :verify_permissions, only: [:edit]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_with_venue)
    if @event.save
      flash[:success] = 'Event Added Successfully!'
      redirect_to event_path(@event.venue, @event)
    else
      flash.now[:danger] = @event.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(params_with_venue)
      flash[:success] = "Event Updated Successfully!"
      @event.update_image_path
      redirect_to event_path(@event.venue, @event)
    else
      flash.now[:danger] = @event.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title,
                                  :supporting_act,
                                  :price,
                                  :date,
                                  :category_id,
                                  :venue_id,
                                  :upload_image)
  end

  def params_with_venue
    return event_params if platform_admin?
    form_params = event_params
    form_params[:venue_id] = current_venue_admin.id
    form_params
  end

  def set_event
    @event = Event.find_by(slug: params[:id])
  end

  def verify_permissions
    unless current_user && @event.venue.admin == current_user
      render file: '/public/404', status => 404, :layout => true
    end
  end

end
