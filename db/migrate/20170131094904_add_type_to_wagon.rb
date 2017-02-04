class AddTypeToWagon < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :type, :string
    add_column :wagons, :side_top_seats, :integer
    add_column :wagons, :side_bottom_seats, :integer
    add_column :wagons, :sitting_seats, :integer
    rename_column :wagons, :low_seats, :bottom_seats
  end
end
