class AddScheduleDataToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :schedule_data, :boolean
  end
end
