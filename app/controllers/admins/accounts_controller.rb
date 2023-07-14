# frozen_string_literal: true

# Module for admin controller
module Admins
  class AccountsController < ApplicationController
    layout 'admin/layout'
    before_action :authorize_admin
    before_action :set_account, only: %i[show edit update destroy]

    def index
      @url = admins_accounts_path
      @queries = 'email_or_phone_cont'

      @q = Account.ransack(params[:q])
      @account = @q.result(distinct: true)
      @pagy, @records = pagy(@account)
    end

    def show
      respond_to do |format|
        format.html
        format.turbo_stream { render turbo_stream: turbo_stream.replace('accounts-frame', partial: 'admins/accounts/show') }
      end
    end

    def new
      @account = Account.new
    end

    def edit
      render turbo_stream: turbo_stream.replace('accounts-frame', partial: 'admins/accounts/edit')
    end

    def create
      @account = Account.new(account_params_create)

      if @account.save
        redirect_to admins_account_url(@account.id)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @account.update(account_params_update)
        redirect_to admins_accounts_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @account.destroy
      redirect_to admins_accounts_path
    end

    private

    def account_params_create
      params.require(:account).permit(:email, :password, :role, :phone, :avatar)
    end

    def account_params_update
      params.require(:account).permit(:phone, :avatar)
    end

    def authorize_admin
      authorize current_account
    end

    def set_account
      @account = Account.find_by(id: params[:id])
    end
  end
end
