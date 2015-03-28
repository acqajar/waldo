class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integeruser2_id :user1_id
      t.integer :ucm_id
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :matches, :users
  end
end
