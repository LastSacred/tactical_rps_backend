class User < ApplicationRecord
  has_many :games_won, :class_name => 'Game', :foreign_key => 'user_id'
  has_many :games_lost, :class_name => 'Game', :foreign_key => 'user_id'
end
