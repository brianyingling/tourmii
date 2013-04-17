class SearchesController < ApplicationController
  def new
    @tour = Tour.new
  end

  def query
    query = params[:search]
    @tours = Tour.where("name @@ :q", :q=>query)
    @tours += Tour.where("description @@ :q", :q=>query)
    @steps = Step.where("name @@ :q", :q=>query)
    @steps = @steps.map {|s| s.tour}.flatten
    @tours = (@tours + @steps).uniq
    return @tours
  end
end