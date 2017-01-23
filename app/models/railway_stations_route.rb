class RailwayStationsRoute < ActiveRecord::Base
  # Значит, что у нас есть рейлвей_стейшн_айди и роут_айди
  belongs_to :railway_station
  belongs_to :route
end