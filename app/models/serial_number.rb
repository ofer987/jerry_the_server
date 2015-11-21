class SerialNumber < ActiveRecord::Base
  # id, integer, PKEY, NOT NULL
  # user_id, integer, foreign_key, NULL
  # name, string, unique index, NOT NULL

  belongs_to :user

  scope :active, -> { where.not(user: nil) }
  scope :inactive, -> { where(user: nil) }

  def used?
    !self.user_id.nil?
  end
end
