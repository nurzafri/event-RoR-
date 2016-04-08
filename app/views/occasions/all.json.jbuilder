json.array!(@occasions) do |occasion|
  json.extract! occasion, :id, :name, :description, :venue, :latitude, :longitude, :user_id
end
