class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :provider
      t.string :name
      t.string :description
      t.float :price
      t.integer :amount

      t.timestamps
    end
  end
end
