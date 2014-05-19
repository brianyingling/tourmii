class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter {:authenticate unless request.method == "OPTIONS"}
  before_filter :cors_preflight_check
  after_filter :set_access_control_headers

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin']  = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      headers['Access-Control-Max-Age'] = '1728000'
      head :ok
    end
  end

  def empty
    render :nothing => true
  end


  private
  def authenticate
      @auth = (session[:user_id].present?) ? User.find(session[:user_id]) : nil
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = '*'
  end


end
