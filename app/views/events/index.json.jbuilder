json.array!(@events) do |event|
  json.extract! event, :title, :description, :user_id
  json.url event_url(event, format: :json)
end
