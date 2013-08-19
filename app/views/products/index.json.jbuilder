json.array!(@products) do |product|
  json.extract! product, :mark_id, :category_id, :name, :side
  json.url product_url(product, format: :json)
end
