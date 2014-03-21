class CreateDashboardSpots < ActiveRecord::Migration
  def change
    create_table :dashboard_spots do |t|
      t.integer :dashboard_id
      t.integer :spot_id

      t.timestamps
    end
  end
end
