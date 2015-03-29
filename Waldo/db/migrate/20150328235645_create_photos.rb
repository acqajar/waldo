class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user, index: true
      t.string :url_image

      t.timestamps null: false
    end
    add_foreign_key :photos, :users
  end
end
