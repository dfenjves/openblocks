class DashboardSpotsController < ApplicationController

	def delete
# find the spot on the join table using params
# destroy row on join table

		@dashboard_spot = DashboardSpot.find_by(:spot_id => params[:id], :dashboard_id => params[:dashboard_id])
		@dashboard_spot.delete
		@dashboard = Dashboard.find(params[:dashboard_id])

		head :ok
	end

end
