class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :rel_type
      t.string :address
      t.integer :radius
      t.float :latitude
      t.float :longitude
      t.integer :age

      t.timestamps null: false
    end
  end
end
