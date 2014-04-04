class DashboardSpotsController < ApplicationController

	def delete
# find the spot on the join table using params
# destroy row on join table

		@dashboard_spot = DashboardSpot.find_by(:spot_id => params[:id], :dashboard_id => params[:dashboard_id])
		# @dashboard_spot.delete
		@dashboard = Dashboard.find(params[:dashboard_id])
    @spot = Spot.find(params[:id])

		respond_to do |f|
      if @dashboard_spot.delete
        f.html {head :ok}
        f.js {render 'delete_success'}
      else
        f.html {head :error}
        f.js {render 'delete_failure'}
      end
    end
	end

end
