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

    def new
      @account = Account.new
    end

    def edit; end

    def create
      @account = Account.new(account_params_create)

      if @account.save
        flash[:success] = ["Account with id: #{@account.id} has been created!"]
        redirect_to admins_account_url(@account.id)
      else
        flash[:error] = @account.errors.full_messages
        redirect_to new_admins_account_path
      end
    end

    def update
      if @account.update(account_params_update)
        flash[:success] = ["Account with id: #{@account.id} has been updated!"]
        redirect_to admins_accounts_path
      else
        flash[:error] = @account.errors.full_messages
        redirect_to edit_admins_account_path
      end
    end

    def destroy
      @account.destroy
      flash[:success] = ["Account with id: #{@account.id} has been destroyed!"]
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
