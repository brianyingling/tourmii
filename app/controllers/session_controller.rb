class SessionController < ApplicationController
  def new
    redirect_to root_path
  end
  def create
    @auth = User.where(:email=>params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
    else
      session[:user_id] = nil
      flash[:notice] = "Incorrect login. Please try again."
    end

  # redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end