class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.string :name, limit: 100, null: true

      t.timestamps
    end
    add_index :marks, :name, unique: true
  end
end
