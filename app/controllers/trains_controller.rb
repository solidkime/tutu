class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  def index
    @trains = Train.all
  end

  # GET /trains/1
  def show
    @wagon_top_seats = 0
    @wagon_low_seats = 0
    @economs = 0
    @coupes = 0
    @train.wagons.each do |wagon|
      @wagon_top_seats += wagon.top_seats
      @wagon_low_seats += wagon.low_seats
      if wagon.wagon_type == 'econom'
        @economs +=1
      elsif wagon.wagon_type == 'coupe'
        @coupes +=1
      end
    end
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  def create
    @train = Train.new(train_params)
    if @train.save
      redirect_to @train, notice: 'Train was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trains/1
  def update
    if @train.update(train_params)
      redirect_to @train, notice: 'Train was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trains/1
  def destroy
    @train.destroy
    redirect_to trains_url, notice: 'Train was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number,:route_id)
    end
end
