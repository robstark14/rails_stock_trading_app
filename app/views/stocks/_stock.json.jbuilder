json.extract! stock, :id, :comp_name, :stock_symbol, :comp_description, :created_at, :updated_at
json.url stock_url(stock, format: :json)
