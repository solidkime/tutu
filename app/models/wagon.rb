class Wagon < ApplicationRecord
  belongs_to :train

  before_save :set_number, on: :create

  scope :from_last, -> { order(number: :desc)}
  scope :from_first, -> { order(number: :asc)}

  validates :number, uniqueness: { scope: :train_id }

  private
  
  def set_number
    self.number = train.wagons.maximum(:number).to_i + 1
  end
end
