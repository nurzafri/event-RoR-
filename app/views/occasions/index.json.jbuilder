json.array!(@occasions) do |occasion|
  json.extract! occasion, :id, :name, :description, :venue, :date, :latitude, :longitude, :user_id
  json.url occasion_url(occasion, format: :json)
end
