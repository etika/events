class EventCategoriesController < ApplicationController
  def index
    # @films = Film.all
    @event_categories = EventCategory.all.order('created_at DESC')
    # same as first line but sort in descending (DESC) order 
    # based on what time they were created
  end

  def new
  	@event_category = EventCategory.new
  end


  def create
    @event_category = EventCategory.new(event_category_params)
    if @event_category.save
      redirect_to @event_category
    else
      render 'new'
    end
  end

  def show
    @event_category = EventCategory.find(params[:id])
  end

  def edit
    @event_category = EventCategory.find(params[:id])
  end

  def update
    @event_category = EventCategory.find(params[:id])
    if @event_category.update(event_category_params)
      redirect_to @event_category
    else
      render 'edit'
    end
  end

  def destroy
    @event_category = EventCategory.find(params[:id])
    @event_category.destroy
    redirect_to root_path
  end

  private

  def event_category_params
  	# require the :film table
  	# security mesure called 'strong params' where we must permit
  	# the different attributes (:title, :description) that you 
  	# want to allow to be written to our database
  	params.require(:event_category).permit(:name, :description);
  end

end
