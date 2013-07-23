class UsersController < ApplicationController
  respond_to :json
  def index
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(params[:user])
  end

  def show
    respond_with User.find(params[:id])
  end

  def update
    @user = user.find(params[:id])
    @user.update_attributes(params[:user])
    render :json => @user
  end
  def default_serializer_options
    {root: false}
  end
end