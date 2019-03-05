class GamesController < ApplicationController

  # def index
  #   @games = Game.all
  #   render json: @games.as_json()
  # end

  def create
    paramh = game_params.to_h
    winner = User.find_or_create_by(username: paramh["winner"])
    loser = User.find_or_create_by(username: paramh["loser"])
    @game = Game.new(winner: winner, loser: loser, turns: paramh["turns"])
    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def game_params
    params.require(:game).permit(:winner, :loser, :turns)
  end
end
