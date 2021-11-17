class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  def my_games
    @my_games = Game.where(owner: current_user)
  end

  def index
    @games = Game.all

    @users = User.all

    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @owner = current_user
    @game.owner = @owner
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @game.update(game_params)
  end

  def destroy
    @game.destroy
    redirect_to my_games_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :number_of_players, :category,:description,:price)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
