class Game < ActiveRecord::Base
  # id, integer, PKEY, NOT NULL
  # user_id, integer, foreign_key, NULL
  # name, string, unique index, NOT NULL

  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
