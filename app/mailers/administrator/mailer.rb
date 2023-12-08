module Administrator
  class Mailer < Devise::Mailer
    def reset_password_instructions(record, token, opts={})
      @token = token
      @resource = record
      mail(to: @resource.email, subject: "Reset Password Instructions")
    end
  end
end
