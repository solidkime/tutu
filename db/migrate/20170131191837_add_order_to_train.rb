class AddOrderToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :order_wagons, :boolean
  end
end
