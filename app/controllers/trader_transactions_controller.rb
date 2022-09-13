class TraderTransactionsController < ApplicationController
    before_action :approved_trader, only: [:index, :show]

  def index
    @transactions = current_user.transactions.order(created_at: "DESC")
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end

  private

  def approved_trader
    if current_user.role == "trader" && current_user.state == "Approved"
      return
    else
      redirect_to root_path, notice: "You need to wait for the approval of your application to perform this actions."
    end
  end
end
