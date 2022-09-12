class AddColumnsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :description, :text
    add_column :events, :address, :string
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
  end
end
