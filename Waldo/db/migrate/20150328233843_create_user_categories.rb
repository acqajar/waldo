class CreateUserCategories < ActiveRecord::Migration
  def change
    create_table :user_categories do |t|
      t.integer :user_id
      t.integer :category_id
      t.references :user, index: true
      t.references :category, index: true
      t.integer :rating

      t.timestamps null: false
    end
    add_foreign_key :user_categories, :users
    add_foreign_key :user_categories, :categories
  end
end
