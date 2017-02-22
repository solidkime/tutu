class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def current_order_wagons
    order_wagons ? wagons.from_first : wagons.from_last
  end

  def count_seats(wagon_type, seats_type)
    wagons.where("type = ?", wagon_type).sum(seats_type.to_sym) if wagon.train
  end
end
