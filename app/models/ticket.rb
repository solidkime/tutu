class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user, optional: true
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :fio, :passport, :number, presence: true
end
