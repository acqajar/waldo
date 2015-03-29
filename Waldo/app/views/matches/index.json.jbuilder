json.array!(@matches) do |match|
  json.extract! match, :id, :user1_id, :user2_id, :ucm_id, :user_id
  json.url match_url(match, format: :json)
end
