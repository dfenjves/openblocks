class DashboardsController < ApplicationController
	before_action :set_dashboard, only: [:show, :edit, :update, :destroy]
	before_action :set_time

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
			Spot.new_by_keyword(get_keyword, @dashboard)
			redirect_to @dashboard
		else
			flash[:erorrs] = "Please name your dashboard"
			render 'new'
		end
	end

	def search
		@results = Dashboard.search_by_keyword(params[:keywords])
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

	def set_time
			@current_time = Time.now.localtime.strftime("%I:%M %p")
	end

	def get_keyword
		params[:city] + params[:keyword]
	end

	def dashboard_params
		params.require(:dashboard).permit(:name)
	end

end
