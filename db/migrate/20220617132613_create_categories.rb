class CreateCategories < ActiveRecord::Migration[7.0]
  def up
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :url_key
      t.boolean :status
      t.integer :parent_id
      t.timestamps
    end
  end
  def down
    drop_table :categories
  end
end
