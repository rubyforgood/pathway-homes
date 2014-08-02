json.array! @request_types do |type|
  json.(type, :id, :category, :request)
end
