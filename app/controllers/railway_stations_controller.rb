class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time_station]
  before_action :set_route, only: [:update_position, :update_time_station]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)
    if @railway_station.save
      redirect_to @railway_station, notice: 'Railway station was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    if @railway_station.update(railway_station_params)
      redirect_to @railway_station, notice: 'Railway station was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.'
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  def update_time_station

    arrival = params[:arrival]
    departure = params[:departure]
    # @time_arrive = Time.zone.local arrival["arrival(1i)"].to_i, arrival["arrival(2i)"].to_i, arrival["arrival(3i)"].to_i, arrival["arrival(4i)"].to_i, arrival["arrival(5i)"].to_i
    # @time_departure = Time.zone.local departure["departure(1i)"].to_i, departure["departure(2i)"].to_i, departure["departure(3i)"].to_i, departure["departure(4i)"].to_i, departure["departure(5i)"].to_i

    @railway_station.update_time_station(@route, arrival, departure)
    redirect_to @route, notice: 'Время изменено успешно.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
      @route = Route.find(params[:route_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
