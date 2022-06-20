class CreateRootCategory < ActiveRecord::Migration[7.0]
  def up
    Category.create(:name => "Root Category", :description => "root category", :parent_id => nil, :status => 1)
  end
  def down
    Category.delete_all(:name => "Root Category")
  end
end
