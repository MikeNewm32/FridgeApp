class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.references :fridge, foreign_key: true
      t.string :name
      t.integer :weight
      t.boolean :is_vegan

      t.timestamps
    end
  end
end
