json.array!(@user_category_matches) do |user_category_match|
  json.extract! user_category_match, :id, :match_id, :user_category_id, :uc_id, :match_id
  json.url user_category_match_url(user_category_match, format: :json)
end
