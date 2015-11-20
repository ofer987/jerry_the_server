json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :user, :json
  json.url statistic_url(statistic, format: :json)
end
