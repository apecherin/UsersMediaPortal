json.array!(@media_items) do |media_item|
  json.extract! media_item, :id
  json.url media_item_url(media_item, format: :json)
end
