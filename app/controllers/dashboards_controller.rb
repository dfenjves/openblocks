class DashboardsController < ApplicationController
	before_action :set_dashboard, only: [:show, :edit, :update, :destroy]
	before_action :set_time

	def index
		@dashboards = Dashboard.all
    @search = Dashboard.search(params[:q])
    @all_found = @search.result
   #  not_found = @dashboards - @all_found
	  # @not_found =  not_found.collect do |dashboard|
	  #   							dashboard.id
	  #   						end

    respond_to do |f|
      if @all_found.length > 1
        f.html {head :ok}
        f.js {render 'search_success'}
      else
        f.html {head :error}
        f.js {render 'search_failure'}
      end
    end
	end

	def show
		respond_to do |f|
			f.html
			f.js
		end
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
		respond_to do |format|
			format.html {head :ok}
			format.js
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
