class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:user_name])
    @ticket = @user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end


  private

  def ticket_params
    params.require(:ticket).permit(:user_name, :fio, :passport, :start_station_id, :end_station_id, :train_id)
  end
end



