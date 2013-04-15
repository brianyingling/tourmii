class SearchesController < ApplicationController
  def new
    @tour = Tour.new
  end

  def query
  end
end