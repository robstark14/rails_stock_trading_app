class DeclinedRequestsController < ApplicationController
    def index
        @request =  User.where(role: "trader", state: "Declined").where.not(confirmed_at: nil).order(confirmed_at: :DESC)
    end

    def destroy
        @user = User.find(params[:id])
        
        if @user.destroy
          UserMailer.with(user: @user).destroy_account_email.deliver_now
          redirect_to declined_requests_path, notice: "You successfully deleted #{@user.email}'s application."
        end
    end
end
