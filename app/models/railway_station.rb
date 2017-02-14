class RailwayStation < ApplicationRecord
  has_many :trains
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").distinct}

  def update_position(route, position)
    station_route = station_route(route)
    @station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_time_station(route, arrival, departure)
    station_route = station_route(route)
    @station_route.update(arrival: arrival, departure: departure) if station_route
  end

  def arrival_in(route)
    time = station_route(route).try(:arrive)
    time.to_s(:time) if time
  end

  def departure_in(route)
    time = station_route(route).try(:departure)
    time.to_s(:time) if time
  end

  private
  
  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
