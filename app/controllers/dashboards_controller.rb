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
		@dashboard = Dashboard.new

		if @dashboard.save
			redirect_to dashboard(@dashboard)
		end
	end

	def edit
	end

	def create
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
	end

end
