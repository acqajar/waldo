class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.references :user_category_match, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :user_category_matches
  end
end
