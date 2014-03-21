class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
    	t.string :name
    	t.string :address
    	t.string :website
    	t.integer :monday_open
			t.integer :monday_close
			t.integer :tuesday_open
			t.integer :tuesday_close
			t.integer :wednesday_open
			t.integer :wednesday_close
			t.integer :thursday_open
			t.integer :thursday_close
			t.integer :friday_open
			t.integer :friday_close
			t.integer :saturday_open
			t.integer :saturday_close
			t.integer :sunday_open
			t.integer :sunday_close

      t.timestamps
    end
  end
end
