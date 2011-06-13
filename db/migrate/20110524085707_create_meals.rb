class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.datetime :eaten_at
      t.string :image_url
      t.integer :calories
      t.integer :user_id
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :meals
  end
end
