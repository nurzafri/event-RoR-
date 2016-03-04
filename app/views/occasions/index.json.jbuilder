json.array!(@occasions) do |occasion|
  json.extract! occasion, :id, :name, :description, :date_time, :date, :time, :latitude, :longitude
  json.url occasion_url(occasion, format: :json)
end
