class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.column :wagon_type, :integer, default: 0
      t.integer :top_seats
      t.integer :low_seats
      t.belongs_to :train
    end
  end
end
