json.array!(@users) do |user|
  json.extract! user, :id, :name, :gender, :rel_type, :address, :radius, :latitude, :longitude, :age
  json.url user_url(user, format: :json)
end
