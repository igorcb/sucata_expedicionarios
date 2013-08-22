json.array!(@cars) do |car|
  json.extract! car, :mark_id, :name
  json.url product_url(car, format: :json)
end
