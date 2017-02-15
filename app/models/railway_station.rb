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

    time_arrive = Time.zone.local arrival["arrival(1i)"].to_i, arrival["arrival(2i)"].to_i, arrival["arrival(3i)"].to_i, arrival["arrival(4i)"].to_i, arrival["arrival(5i)"].to_i
    time_departure = Time.zone.local departure["departure(1i)"].to_i, departure["departure(2i)"].to_i, departure["departure(3i)"].to_i, departure["departure(4i)"].to_i, departure["departure(5i)"].to_i

    station_route = station_route(route)
    @station_route.update(arrival: time_arrive, departure: time_departure) if station_route
  end

  def arrival_in(route)
    time = station_route(route).try(:arrival)
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
