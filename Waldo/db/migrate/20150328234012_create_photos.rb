class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.referencesurl_image :user

      t.timestamps null: false
    end
  end
end
