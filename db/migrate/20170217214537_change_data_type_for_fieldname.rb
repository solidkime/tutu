class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.0]
  def change
    change_column :wagons, :number, 'integer USING CAST(number AS integer)'
  end
end
