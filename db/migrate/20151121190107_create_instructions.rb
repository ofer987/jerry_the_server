class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.references :game, index: true, foreign_key: true, null: false
      t.references :command, index: true, foreign_key: true, null: false
      t.string :name, null: true
      t.text :parameters, null: true
      t.integer :precedence, null: false, default: 0

      t.timestamps null: false
    end
  end
end
