class Game < ActiveRecord::Base
  # id, integer, PKEY, NOT NULL
  # user_id, integer, foreign_key, NULL
  # name, string, unique index, NOT NULL

  belongs_to :user

  has_many :instructions
  has_many :commands, through: :instructions

  validates :name, presence: true, uniqueness: true
end
