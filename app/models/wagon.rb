class Wagon < ApplicationRecord
  belongs_to :train

  scope :fromlast, -> { order(number: :desc)}
  scope :fromfirst, -> { order(number: :asc)}

  validates :number, uniqueness: { scope: :train_id }
end
