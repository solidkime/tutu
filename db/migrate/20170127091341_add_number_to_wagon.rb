class AddNumberToWagon < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :number, :string
  end
end
