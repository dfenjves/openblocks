class DashboardSpotsController < ApplicationController

	def delete
		@dashboard_spot = DashboardSpot.find_by(:spot_id => params[:id], :dashboard_id => params[:dashboard_id])
		@dashboard_spot.delete if @dashboard_spot != nil
		@dashboard = Dashboard.find(params[:dashboard_id])
    redirect_to @dashboard
	end

end
