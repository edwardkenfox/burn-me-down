json.array!(@issues) do |issue|
  json.extract! issue, :id, :url, :open
  json.url issue_url(issue, format: :json)
end
