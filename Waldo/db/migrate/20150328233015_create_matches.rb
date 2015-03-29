class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.integer :ucm_id
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :matches, :users
  end
end
