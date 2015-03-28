json.array!(@user_categories) do |user_category|
  json.extract! user_category, :id, :user_id, :category_id, :user_id, :category_id, :rating
  json.url user_category_url(user_category, format: :json)
end
