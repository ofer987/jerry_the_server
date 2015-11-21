class RenameUserToUserIdOnStatistics < ActiveRecord::Migration
  def change
    rename_column :statistics, :user, :user_id
  end
end
