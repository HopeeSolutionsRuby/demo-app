class UserMailer < ApplicationMailer

  def password_reset(user)
    @user = user
    email to: user.email, subject: "Password reset"
  end
end