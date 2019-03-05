class Game < ApplicationRecord
  belongs_to :winner, :class_name => "User", foreign_key: 'winner_id'
  belongs_to :loser, :class_name => "User", foreign_key: 'loser_id'
  # accepts_nested_attributes_for :users

  def users
    [winner, loser]
  end

end
