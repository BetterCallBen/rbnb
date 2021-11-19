class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy average_rating]
  def my_games
    @my_games = Game.where(owner: current_user)
  end

  def index
    @games = Game.where.not(owner_id: current_user.id)
    @users = User.where.not(id: current_user.id)

    if params[:city].present?
      @users = @users.near(params[:city], 20)
      user_ids = @users.map(&:id).uniq
      @games = @games.where(owner_id: user_ids)
    end
    if params[:category].present?
      @games = @games.where(category: params[:category])
    end

    if params[:date].present?
      @games = @games.select do |game|
        game.is_available?(params[:date])
      end
      user_ids = @games.map(&:owner_id).uniq
      @users = @users.where(id: user_ids)
    end

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("picto#{user.games.count}.png")
      }
    end
  end

  def show
    @rating = average_rating
  end

  def average_rating
    if @game.reviews.count.positive?
      sum = 0
      @game.reviews.each do |review|
        sum += review.rating
      end
      return sum.to_f / @game.reviews.count
    end
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
    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    redirect_to my_games_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :number_of_players, :category, :description, :price, photos: [])
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
