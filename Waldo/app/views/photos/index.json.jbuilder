json.array!(@photos) do |photo|
  json.extract! photo, :id, :user
  json.url photo_url(photo, format: :json)
end
