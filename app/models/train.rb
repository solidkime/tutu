class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :tickets
  has_many :wagons, before_add: :set_number

  def current_order_wagons
    order_wagons ? wagons.fromfirst : wagons.fromlast
  end

  def count_seats(wagon_type, seats_type)
    wagons.where("type = ?", wagon_type).sum(seats_type.to_sym)
  end
  private

  def set_number(wagon)
    wagon.number = wagons.maximum(:number).to_i + 1
    puts "WAT"
  end

end
