class TransactionsController < ApplicationController
    before_action :verify_is_admin, only: [:index, :show]

  def index
    @all_transactions = Transaction.all.order(created_at: "DESC")
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def verify_is_admin
    if current_user.admin ==  true
       return
    else
       redirect_to root_path, notice: "You must be an admin to perform this action."
    end
  end
end
