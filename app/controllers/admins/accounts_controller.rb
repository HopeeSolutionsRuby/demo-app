# frozen_string_literal: true

# Module for admin controller
module Admins
  class AccountsController < ApplicationController
    layout 'admin/layout'
    before_action :authorize_admin
    before_action :set_account, only: %i[show edit update destroy]

    def index
      @q = Account.ransack(params[:q])
      @account = @q.result(distinct: true)
      @pagy, @records = pagy(@account)
    end

    def show; end

    def edit; end

    def update
      if @account.update(account_params)
        redirect_to admins_account_url(@account)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @account.destroy

      redirect_to admins_accounts_path
    end

    private

    def account_params
      params.require(:account).permit(:email, :password, :password_confirmation, :phone, :avatar, :role)
    end

    def authorize_admin
      authorize current_account
    end

    def set_account
      @account = Account.find(params[:id])
    end
  end
end
