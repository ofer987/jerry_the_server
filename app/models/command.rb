class Command < ActiveRecord::Base
  # id, integer, PKEY, NOT NULL
  # name, string, unique index, NOT NULL
  # data, integer, NOT NULL

  has_many :instructions
  has_many :games, through: :instructions

  has_many :instructions
  has_many :games, through: :instructions

  validates :name, presence: true, uniqueness: true
  validates :data, presence: true
end
