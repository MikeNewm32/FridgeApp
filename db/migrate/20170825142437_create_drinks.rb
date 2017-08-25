class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.references :fridge, foreign_key: true
      t.string :name
      t.integer :size
      t.boolean :is_alcoholic

      t.timestamps
    end
  end
end
