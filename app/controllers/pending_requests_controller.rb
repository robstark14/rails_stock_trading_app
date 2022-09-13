class PendingRequestsController < ApplicationController

    def index
        @request =  User.where(role: "trader", state: "Pending").where.not(confirmed_at: nil).order(:confirmed_at)
    end

    def update
        debugger
        @user = User.find(params[:id])
        if @user.update(state: params[:state])
            UserMailer.with(user: @user).approve_email.deliver_now if params[:state] == "Approved"
            UserMailer.with(user: @user).decline_email.deliver_now if params[:state] == "Declined"
            redirect_to pending_requests_path, notice: "#{@user.email} has been #{@user.state}"
        end 
    end

# private

#     def state_params
#         params.require(:user).permit(:state)
#     end
end 