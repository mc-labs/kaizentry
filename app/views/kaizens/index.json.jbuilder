json.array!(@kaizens) do |kaizen|
  json.extract! kaizen, :id
  json.url kaizen_url(kaizen, format: :json)
end
