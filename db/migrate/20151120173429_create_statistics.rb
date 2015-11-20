class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :user, null: false
      t.text :json, null: false

      t.timestamps null: false
    end
  end
end
