class ActiveGame < ActiveRecord::Base
  # id, integer, PKEY, NOT NULL
  # game_id, integer, foreign_key, NULL
  # user_id, integer, foreign_key, NULL

  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true, uniqueness: true
end
