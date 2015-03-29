json.array!(@events) do |event|
  json.extract! event, :id, :name, :desc, :user_category_match_id
  json.url event_url(event, format: :json)
end
