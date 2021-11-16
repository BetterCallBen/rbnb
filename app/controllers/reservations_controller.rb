class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @game = Game.find(params[:game_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @game = Game.find(params[:game_id])
    @reservation.game = @game
    if reservation.save
      # redirect_to games_path
      redirect_to my_reservations_path
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    # redirect_to games_path
    redirect_to my_reservations_path
  end

  def my_reservations
    @my_reservations = Reservation.where(player: current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :date, :player_id)
  end
end
