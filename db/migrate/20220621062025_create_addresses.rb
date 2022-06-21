class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :users, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :zip
      t.string :street
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
