json.array!(@charts) do |chart|
  json.extract! chart, :id, :name
  json.url chart_url(chart, format: :json)
end
