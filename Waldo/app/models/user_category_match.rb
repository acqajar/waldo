class UserCategoryMatch < ActiveRecord::Base
  belongs_to :match
  belongs_to :user_category
end
