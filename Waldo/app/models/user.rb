class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	has_many :photos
	has_many :user_categories
	has_many :matches

		def user_potential_match
		@user = User.find_by_sql "SELECT u.id,
      CAST(SUM(uc1.rating) AS FLOAT) /
        (SELECT COUNT(*)
          FROM categories AS c
            INNER JOIN users AS u ON u.id = uc.user_id
          WHERE user_id = uc1.user_id)) -
      (CAST(SUM(uc2.rating) AS FLOAT) /
        (SELECT COUNT(*)
          FROM categories AS c
            INNER JOIN place_categories AS pc ON c.id = pc.category_id
            INNER JOIN user_places AS up ON up.place_id = pc.place_id
            INNER JOIN users AS u ON u.id = up.user_id
          WHERE user_id = up2.user_id))) * 2) AS score"	
		end

		
end
