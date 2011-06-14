class AddCommentableIdToMeals < ActiveRecord::Migration
  def self.up
    change_table :meals do |t|
      t.references :comment
    end
    change_table :users do |t|
      t.references :comment
    end

  end

  def self.down
    remove_column :meals, :comment_id
    remove_column :users, :comment_id
  end
end

