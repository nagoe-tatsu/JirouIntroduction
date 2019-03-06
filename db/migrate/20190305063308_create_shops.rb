class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false, length: 50
      t.string :address, null: false, length: 50
      t.string :phone, null: false, length: 20
      t.text :description, null: false, length: 1000

      t.timestamps
    end
  end
end
