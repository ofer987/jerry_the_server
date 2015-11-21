class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.references :game, index: true, foreign_key: true, null: false
      t.references :command, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.text :parameters, null: true

      t.timestamps null: false

      t.index :name, unique: true
    end
  end
end
