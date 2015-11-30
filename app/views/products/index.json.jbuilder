json.array!(@products) do |product|
  json.extract! product, :id, :name, :contition_id, :description, :author, :type_of_id, :photo
  json.url product_url(product, format: :json)
end
