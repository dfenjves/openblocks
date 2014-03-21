class Dashboard < ActiveRecord::Base
	has_many :dashboard_spots
	has_many :spots, :through => :dashboard_spots
end
