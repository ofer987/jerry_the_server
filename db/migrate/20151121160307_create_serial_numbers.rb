class CreateSerialNumbers < ActiveRecord::Migration
  def change
    create_table :serial_numbers do |t|
      t.references :user, null: true
      t.string :name, null: false

      t.timestamps null: false

      t.index :name, unique: :true
    end
  end
end
