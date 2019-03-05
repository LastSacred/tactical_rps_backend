class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.integer :turns

      t.timestamps
    end
    # add_foreign_key :winner, :user, column: :winner_id, primary_key: :id
    # add_foreign_key :loser, :user, column: :loser_id, primary_key: :id
  end
end
