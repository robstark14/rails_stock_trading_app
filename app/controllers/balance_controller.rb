class BalanceController < ApplicationController
  before_action :set_user

  def deposit
  end
  
  def withdraw
  end
  
  def show;
  end

  def confirm_deposit
    @user.balance += balance_params[:balance].to_d

    if @user.save!
        redirect_to root_path, notice: 'Succesful Deposit'
    else
        render :deposit
    end
  end

  def confirm_withdrawal
    if @user.save!
      if balance_params[:balance].to_d < @user.balance
          @user.balance -= balance_params[:balance].to_d
          # redirect_to portfolio_stocks_path, notice: 'Withdrawal successful.'
          redirect_to stocks_path, notice: "Withdrawal successful"
      else
        redirect_to withdraw_balance_path, alert: "Please input a correct amount."
      end
    else
      render :withdraw
    end
  end

private

  def balance_params
    params.require(:user).permit(:balance)
  end

  def set_user
    @user = current_user
  end

#   def approved_trader
    # if current_user.role == "trader" && current_user.state == "Approved"
    #   return
    # else
    #   redirect_to portfolio_stocks_path, notice: "Please wait until your application has been approved before doing this action."
    # end
#   end
end
