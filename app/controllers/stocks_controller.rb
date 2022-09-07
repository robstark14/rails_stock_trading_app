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

  # # GET /stocks/new
  # def new
  #   @stock = Stock.new
  # end

  # # GET /stocks/1/edit
  # def edit
  # end

  # # POST /stocks or /stocks.json
  # def create
  #   @stock = Stock.new(stock_params)

  #   respond_to do |format|
  #     if @stock.save
  #       format.html { redirect_to stock_url(@stock), notice: "Stock was successfully created." }
  #       format.json { render :show, status: :created, location: @stock }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @stock.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /stocks/1 or /stocks/1.json
  # def update
  #   respond_to do |format|
  #     if @stock.update(stock_params)
  #       format.html { redirect_to stock_url(@stock), notice: "Stock was successfully updated." }
  #       format.json { render :show, status: :ok, location: @stock }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @stock.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /stocks/1 or /stocks/1.json
  # def destroy
  #   @stock.destroy

  #   respond_to do |format|
  #     format.html { redirect_to stocks_url, notice: "Stock was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_stock
  #     @stock = Stock.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def stock_params
  #     params.require(:stock).permit(:comp_name, :stock_symbol, :comp_description)
  #   end
end
