json.array!(@users) do |user|
  json.extract! user, :id, :serial_number, :email, :active
  json.url user_url(user, format: :json)
end
