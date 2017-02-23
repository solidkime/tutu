class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :add_railway_station]

  def index
    @routes = Route.all
  end

  def show  
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to [:admin, @route]
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_url
  end

  def add_railway_station
    station = RailwayStation.find params[:railway_station][:railway_station_id]
    @route.railway_stations << station
    if @route.save
      redirect_to [:admin, @route], notice: "Станция добавлена успешно"
    end
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title)
  end

end