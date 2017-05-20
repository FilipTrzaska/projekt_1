class AddCategoryIdToPizzas < ActiveRecord::Migration
  def change
    add_column :pizzas, :category_id, :integer
  end
end
