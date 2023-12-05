# frozen_string_literal: true

module Administrator
<<<<<<< HEAD
  # Class BaseController
  class BaseController < ApplicationController
    before_action :authenticate_administrator_admin!
=======
  class BaseController < ApplicationController
>>>>>>> 4e61298 ([Issue 33]: Fix Reviews)
    layout 'admin'
  end
end
