class Search < ActiveRecord::Base
  def self.search(start_station, end_station)
    search_routes = start_station.routes & end_station.routes
    trains = Train.where(route: search_routes)

    # search_routes.each do |route|
    #   trains << route.trains
    # end


    #trains.flatten!
  end
end