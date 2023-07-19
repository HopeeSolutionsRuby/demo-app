# frozen_string_literal: true

module Admins
  class EmployersController < ApplicationController
    layout 'admin/layout'
    before_action :set_employer, only: %i[show]

    def index
      @q = Employer.includes(:account).ransack(params[:q])
      employers = @q.result(distinct: true)
      @pagy, @records = pagy(employers)
    end

    def show; end

    def set_employer
      @employer = Employer.find_by(id: params[:id])
    end
  end
end
