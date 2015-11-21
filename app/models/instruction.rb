class Instruction < ActiveRecord::Base
  # id, integer, PKEY, NOT NULL
  # game_id, integer, foreign_key, NOT NULL
  # command_id, integer, foreign_key, NOT NULL
  # name, string, unique index, NOT NULL
  # parameters, text (serialized as JSON/Ruby Hash), NULL
  # precedence, integer, NOT NULL, default: 0

  belongs_to :game
  belongs_to :command

  validates :name, presence: true

  serialize :parameters
end
