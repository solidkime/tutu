class RailwayStation < ApplicationRecord
  has_many :trains
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.index_station").uniq }

  def update_index_station(route, index_station)
    station_route = station_route(route)
    @station_route.update_attribute(:index_station, index_station) if station_route
  end

  private
  
  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end

end
