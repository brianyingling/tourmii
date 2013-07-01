class ToursController < ApplicationController
  respond_to :json

  def index
    @tours = @auth.tours.all
    @orders = @auth.orders
  end

  def new
    @tour = Tour.new
  end
  def create
    @tour = Tour.create(params[:tour])
    @tour.user = @auth
    @tour.save
    respond_with @tour
  end
  def show
    respond_with Tour.find(params[:id])
  end

  def purchase
    tour = Tour.find(params[:id])
    order = Order.create(:date_purchased=>Time.now)
    @auth.orders << order
    tour.orders << order
    # send out a confirmation email
    Notifications.confirm_purchase(@auth, tour)
    @tours = @auth.tours
    @orders = @auth.orders
  end

  def update
    @tour = Tour.find(params[:id])
    @tour.update_attributes(params[:tour])
    respond_with @tour
  end

  # written so that we don't have the name appearing as the root of the JSON
  # Probably should move this to ApplicationController so that its for all
  # controllers
  def default_serializer_options
    {root: false}
  end


end