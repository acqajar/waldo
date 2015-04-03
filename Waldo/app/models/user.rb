class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	has_many :photos
	has_many :user_categories
  has_many :categories, through: :user_categories
  accepts_nested_attributes_for :user_categories
  accepts_nested_attributes_for :photos, :allow_destroy => true
	has_many :matches
  #   has_attached_file :image, :styles => { 
  #   :medium => "300x300>", 
  #   :thumb => "100x100>" }, 
  #   :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_attached_file :photo




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

		def index
      @user = Users.all 
    end
end
