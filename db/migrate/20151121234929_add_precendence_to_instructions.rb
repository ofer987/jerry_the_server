class AddPrecendenceToInstructions < ActiveRecord::Migration
  def change
    add_column :instructions, :precedence, :integer, null: false, default: 0
  end
end
