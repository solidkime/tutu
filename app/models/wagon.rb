class Wagon < ActiveRecord::Base
  enum wagon_type: [ :econom, :coupe ]

  belongs_to :train
end