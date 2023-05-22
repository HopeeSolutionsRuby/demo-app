class UserMailer < ApplicationMailer

  def password_reset(user)
    @user = user
    mail to: user.mail, subject: "Password reset"
  end
end