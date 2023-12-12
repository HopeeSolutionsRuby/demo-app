# frozen_string_literal: true

module Administrator
  class Mailer < Devise::Mailer
    def reset_password_instructions(record, token, _opts = {})
      super
    end
  end
end
