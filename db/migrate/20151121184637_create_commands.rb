class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :name, null: false
      t.integer :data, null: false

      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
