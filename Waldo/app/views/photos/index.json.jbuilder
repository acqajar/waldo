json.array!(@photos) do |photo|
  json.extract! photo, :id, :user_id, :url_image
  json.url photo_url(photo, format: :json)
end
