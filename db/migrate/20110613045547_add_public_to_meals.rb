class AddPublicToMeals < ActiveRecord::Migration
  def self.up
    add_column :meals, :public, :boolean
  end

  def self.down
    remove_column :meals, :public
  end
end
