class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.string :description, null: false
      t.integer :movement_type, null: false
      t.decimal :value, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
