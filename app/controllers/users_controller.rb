class UsersController < ApplicationController
  respond_to :json
  def index
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to tours_path
    end
  end

  def show
    respond_with User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.save
    # @user.update_attributes(params[:user])
    render :json => @user
  end
  def default_serializer_options
    {root: false}
  end
end