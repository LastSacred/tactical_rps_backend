class LeaderboardController < ApplicationController

  def show
    users = User.all
    leaderboard = []
    users.each do |u|
      entry = {}
      entry["username"] = u.username
      entry["wins"] = Game.where(winner: u).count
      entry["losses"] = Game.where(loser: u).count
      leaderboard.push(entry)
    end
    @sorted_leaderboard = leaderboard.sort_by{|k| k["wins"]}.reverse
    render json: @sorted_leaderboard
  end

end
