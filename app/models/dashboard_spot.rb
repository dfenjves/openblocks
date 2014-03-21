class DashboardSpot < ActiveRecord::Base
	belongs_to :spot
	belongs_to :dashboard
end
