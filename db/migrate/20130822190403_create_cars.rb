class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :mark_id, null: false
      t.string :name, limit: 100, null: false

      t.timestamps
    end
  end
end
