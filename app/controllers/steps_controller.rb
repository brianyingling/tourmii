class StepsController < ApplicationController
  respond_to :json

  def index
    respond_with Step.all()
  end

  def show
    respond_with Step.find(params[:id])
  end

  def default_serializer_options
    {root: false}
  end
end