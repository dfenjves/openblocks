class DashboardsController < ApplicationController
	before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

	def index
		@dashboards = Dashboard.all
	end

	def show
		
	end

	def new
		@dashboard = Dashboard.new
	end

	def create
		@dashboard = Dashboard.new(dashboard_params)

		if @dashboard.save
			redirect_to @dashboard
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private

	def set_dashboard
		@dashboard = Dashboard.find(params[:id])
	end

	def dashboard_params
		params.require(:dashboard).permit(:name)
	end

end
