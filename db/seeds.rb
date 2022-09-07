# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#admin account
User.create(
    email: ENV['ADMIN_EMAIL'], 
    password: ENV['ADMIN_PASS'], 
    password_confirmation: ENV['ADMIN_PASS_CONFIRM'], 
    state: 'Approved',
    role: 'admin',
    confirmed_at: DateTime.now
)

#seed stocks database with default values
blue_chips_stocks = ['ABBV', 'AXP']
    # 'BA', 'BAC', 'C', 'CAT', 'CI', 'CVX', 'DD', 'DIS', 'GE', 'GM', 'HD', 'HPQ', 'IBM', 'JNJ', 'JPM',
    #  'KO', 'MCD', 'MMM', 'MRK', 'PFE', 'PG', 'T', 'VZ', 'WMT', 'XOM']

client = IEX::Api::Client.new(
    publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
    secret_token: ENV['IEX_API_SECRET_TOKEN'],
    endpoint: 'https://cloud.iexapis.com/v1'
)

blue_chips_stocks.each do |stock|
    Stock.create(
        stock_symbol: stock, 
        comp_name: client.company(stock).company_name, 
        comp_description: client.company(stock).description
    )
end