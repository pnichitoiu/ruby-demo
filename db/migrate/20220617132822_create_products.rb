class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.string :url_key
      t.decimal :price
      t.boolean :status
      t.timestamps
    end
  end
end
