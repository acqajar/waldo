class CreateUserCategoryMatches < ActiveRecord::Migration
  def change
    create_table :user_category_matches do |t|
      t.references :match, index: true
      t.references :user_category, index: true
      t.integer :uc_id
      t.integer :match_id

      t.timestamps null: false
    end
    add_foreign_key :user_category_matches, :matches
    add_foreign_key :user_category_matches, :user_categories
  end
end
