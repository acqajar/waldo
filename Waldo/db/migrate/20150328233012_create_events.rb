class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :categories
  end
end
