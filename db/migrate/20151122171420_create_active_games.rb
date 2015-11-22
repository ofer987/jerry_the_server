class CreateActiveGames < ActiveRecord::Migration
  def change
    create_table :active_games do |t|
      t.references :game, index: true, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false

      t.index :user_id, unique: true
    end
  end
end
