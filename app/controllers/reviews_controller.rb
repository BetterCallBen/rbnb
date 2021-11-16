class ReviewsController < ApplicationController
  before_action :set_params, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.game = @game
    if @review.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to game_path(@review)
  end

  private

  def set_params
    @game = Game.find(params[:game_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
