class ChangeDatesToBeDatetimeInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :start_time, :datetime
    change_column :events, :end_time, :datetime
  end
end
