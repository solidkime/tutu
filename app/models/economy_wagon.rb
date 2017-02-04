class EconomyWagon < Wagon
  validates :top_seats, :bottom_seats, :side_bottom_seats, :sitting_seats, presence: true
end