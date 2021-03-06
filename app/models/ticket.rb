class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user, optional: true
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :fio, :passport, :number, presence: true

  after_create :send_notification
  after_destroy :send_cancelation

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_cancelation
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end
end
