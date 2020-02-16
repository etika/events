class EventsController < ApplicationController
    load_and_authorize_resource  class: "Event"
     #skip_authorize_resource only: :index
  def index
    @events = Event.all.order('created_at DESC')
  end

  def new
  	@event = Event.new
  end


  def create
    @event= Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event= Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    current_user.events.delete(@event)
    redirect_to root_path
  end

  def attend_event
    attend = params[:attend]
    user_event= UserEvent.where(user_id: current_user.id, event_id: params[:event_id]).first
    if user_event.present?
      user_event.update_attributes(attend: params[:attend])
    else
      current_user.user_events.create(event_id:params[:event_id], attend: attend)
    end
  end

  private

  def event_params
  	params.require(:event).permit(:name, :location, :event_date, :fees, :event_category_id);
  end

end
