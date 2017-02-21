class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  def new
    @ticket = Ticket.new
    #@user = User.new
  end

  def show
  end

  def index
    @tickets = Ticket.all
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully deleted.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:user_name, :fio, :passport, :start_station_id, :end_station_id, :train_id, :number)
  end
end



