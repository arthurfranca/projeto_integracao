json.array!(@rents) do |rent|
  json.extract! rent, 
  json.url rent_url(rent, format: :json)
end
