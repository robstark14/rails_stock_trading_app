class PortfoliosController < ApplicationController
   
    before_action :approved_trader, only: [:show, :buy, :create, :sell, :confirm_sell]
    before_action :set_user, only: [:update, :create, :confirm_sell]
  
    def index
      @portfolios = current_user.portfolios
    end
  
    def show
      @portfolio = current_user.portfolios.find(params[:id])
    end
  
    def buy
      stocksymbol = params[:stocksymbol]
      @portfolio = current_user.portfolios.find_or_initialize_by(:stock_symbol => stocksymbol) do |p|
        p.quantity = 0
      end
      
    end
  
    def update
      @portfolio = current_user.portfolios.find_by(:stock_symbol => portfolio_params[:stock_symbol])
      new_quantity = @portfolio.quantity + portfolio_params[:quantity].to_d
      deducted_amount = @portfolio.access_quote.latest_price * portfolio_params[:quantity].to_d
  
      ActiveRecord::Base.transaction do
        @user.update!(:balance => @user.balance -= deducted_amount)
        @portfolio.update!(:quantity => new_quantity)
        redirect_to @portfolio, notice: 'Stock was successfully bought.'
        create_transaction_record(true)
      end
  
      rescue ActiveRecord::RecordInvalid
      redirect_to buy_portfolio_path(:stocksymbol => @portfolio.stock_symbol), alert: "Transaction failed. Please input correct quantity."
    end
  
    def create 
      @portfolio = current_user.portfolios.build(portfolio_params)
      deducted_amount = @portfolio.access_quote.latest_price * portfolio_params[:quantity].to_d
  
      ActiveRecord::Base.transaction do
        @portfolio.save
        @user.update!(:balance => @user.balance -= deducted_amount)
        redirect_to @portfolio, notice: 'Stock was successfully bought.'
        create_transaction_record(true)
      end
  
      rescue ActiveRecord::RecordInvalid
      redirect_to portfolios_path, alert: "Transaction failed. Please input correct quantity."
    end
  
    def sell
      stocksymbol = params[:stocksymbol]
      @portfolio = current_user.portfolios.find_by(:stock_symbol => stocksymbol)
    end
  
    def confirm_sell
      stocksymbol = portfolio_params[:stock_symbol]
      @portfolio = current_user.portfolios.find_by(:stock_symbol => stocksymbol)
  
      ActiveRecord::Base.transaction do
        @portfolio.quantity -= portfolio_params[:quantity].to_d
        added_amount = @portfolio.access_quote.latest_price * portfolio_params[:quantity].to_d
  
        if @portfolio.save && @user.update(:balance => @user.balance += added_amount)
          redirect_to portfolios_path, notice: 'Stock was successfully sold.'
          create_transaction_record(false)
          @portfolio.delete_zero_quantity_stock
        else
          render :sell
        end
      end
    end
  
    private
  
    def portfolio_params
      params.require(:portfolio).permit(:stock_symbol, :quantity)
    end
  
    def create_transaction_record(transaction_type)
      current_user.transactions.create(
        :stock_symbol => @portfolio.stock_symbol,
        :transaction_type => transaction_type,
        :order_quantity => portfolio_params[:quantity].to_d,
        :buying_price => @portfolio.access_quote.latest_price,
        :amount => portfolio_params[:quantity].to_d * @portfolio.access_quote.latest_price
      )
    end
    
    def approved_trader
      if current_user.role == "trader" && current_user.state == "Approved"
        return
      else
        redirect_to root_path, notice: "Please wait until your application has been approved before doing this action."
      end
    end
  
    def set_user
      @user = current_user
    end
  end