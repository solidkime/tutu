class Wagon < ActiveRecord::Base
  enum wagon_type: [ :econom, :coupe ]
end