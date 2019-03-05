class GamesController < ApplicationController

  # def index
  #   @games = Game.all
  #   render json: @games.as_json()
  # end

  def create
    paramh = game_params.to_h
    @game = Game.new(winner: paramh["winner"], loser: paramh["loser"], turns: paramh["turns"])
    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
  end

  private
  def game_params
    params.require(:game).permit(:winner, :loser, :turns)
  end
end
