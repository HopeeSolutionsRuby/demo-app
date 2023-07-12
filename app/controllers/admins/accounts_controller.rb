# frozen_string_literal: true

module Admins
  class AccountsController < ApplicationController
    layout 'admin/layout'
    before_action :authorize_admin

    def index
      @q = Account.ransack(params[:q])
      @account = @q.result(distinct: true)
      @pagy, @records = pagy(@account)
    end

    def edit
      @account = Account.find_by(id: params[:id])
      authorize @account
    end

    private

    def authorize_admin
      authorize current_account
    end
  end
end
