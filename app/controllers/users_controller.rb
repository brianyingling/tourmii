class UsersController < ApplicationController
  def index
    binding.pry
  end
  def new
    @user = User.new
  end
  def create
    binding.pry
    @user = User.create(params[:user])
  end
  def show
    @user = User.find(params[:id])
    render :json => @user
  end
  def update
    binding.pry

  end
end