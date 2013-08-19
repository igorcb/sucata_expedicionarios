class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :mark, index: true
      t.references :category, index: true
      t.string :name, limit: 100, null:true
      t.integer :side, null: true

      t.timestamps
    end
  end
end
