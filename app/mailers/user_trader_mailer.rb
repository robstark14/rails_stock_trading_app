class UserTraderMailer < ApplicationMailer
    before_action :set_user
    default from: "romel.051892@gmail.com"

  def approve_email
    mail(to: @user.email, subject: "Your account has been approved")
  end

  def decline_email
    mail(to: @user.email, subject: "Your account has been declined")
  end

  def destroy_account_email
    mail(to: @user.email, subject: "Your account has been deleted")
  end

  private
   def set_user
    @user = params[:user]
   end
end
