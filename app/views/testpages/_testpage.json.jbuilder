json.extract! testpage, :id, :title, :url, :created_at, :updated_at
json.url testpage_url(testpage, format: :json)
