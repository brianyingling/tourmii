class SessionController < ApplicationController
  def new
    redirect_to root_path
  end
  def create
    @auth = User.where(:email=>params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
      @tours = @auth.tours
    else
      @auth = nil
      session[:user_id] = nil
      flash[:notice] = "Incorrect login. Please try again."
    end

    # render auth if successful, otherwise return error msg
    if @auth.present?
      render :json => @auth, :head => :ok
    else
      render :json => {:error => {:message =>"Invalid username or password"}}, :status => :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end