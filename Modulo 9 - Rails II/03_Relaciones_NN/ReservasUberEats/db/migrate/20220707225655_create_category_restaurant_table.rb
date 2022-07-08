class CreateCategoryRestaurantTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :restaurants
  end
end
