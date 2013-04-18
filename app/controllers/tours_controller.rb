class ToursController < ApplicationController
  def index
    @tours = @auth.tours.all
    @orders = @auth.orders
  end

  def new
    @tour = Tour.new
  end
  def create
    @tour = Tour.new
    (0...params[:tour].length).to_a.each do |num|
      if num.to_s == '0'
        @tour.name = params[:tour][num.to_s][:name]
        @tour.description = params[:tour][num.to_s][:description]
      else
        step = Step.new
        step.name = params[:tour][num.to_s][:name]
        step.address = params[:tour][num.to_s][:address]
        step.reference = params[:tour][num.to_s][:reference]
        step.position = num
        step.save
        @tour.steps << step
      end
    end
    @tour.save
    @auth.tours << @tour
  end
  def show
    @tour = Tour.find(params[:id])
    @steps = @tour.steps
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


end