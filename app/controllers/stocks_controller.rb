class StocksController < ApplicationController
  # before_action :set_stock, only: %i[ index, show ]
  before_action :authenticate_user!

  # GET /stocks or /stocks.json
  def index
    client = IEX::Api::Client.new(
      publishable_token: "pk_b3ce259e9e674fef8588c3da61ef3bf8",
      secret_token: 'sk_0316d9022ff64b7fa63b2f194df3559e',
      endpoint: 'https://cloud.iexapis.com/v1'
  )
    @stocks = Stock.all
    @quote = client.quote('AA')

    # quote.latest_price # 90.165
    # quote.change # 0.375
    # quote.change_percent # 0.00418
    # quote.change_percent_s
  end

  # GET /stocks/1 or /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
  end


end
