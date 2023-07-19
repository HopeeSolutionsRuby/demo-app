# frozen_string_literal: true

module Admins
  class EmployersController < ApplicationController
    layout 'admin/layout'
    before_action :set_employer, only: %i[edit update destroy show]

    def index
      @q = Employer.includes(:account).ransack(params[:q])
      employers = @q.result(distinct: true)
      @pagy, @records = pagy(employers)
    end

    def show; end

    def new
      @employer = Employer.new
      @employer.build_account
    end

    def edit; end

    def create
      @employer = Employer.new(employer_params_create)

      if @employer.save
        flash[:success] = "Employer with id: #{@employer.id} has been created!"
        redirect_to admins_employers_path
      else
        flash[:error] = @employer.errors.full_messages
        redirect_to new_admins_employer_path
      end
    end

    def update
      if @employer.update(employer_params_update)
        flash[:success] = "Employer with id: #{@employer.id} has been updated!"
        redirect_to admins_employers_path
      else
        flash[:error] = @employer.errors.full_messages
        redirect_to edit_admins_employer_path
      end
    end

    def destroy
      @employer.destroy
      flash[:success] = "Employer with id: #{@employer.id} has been destroyed!"
      redirect_to admins_employers_path
    end

    private

    def employer_params_create
      params.require(:employer).permit(:name, :address, :company_size, :description, :website,
                                       account_attributes: %i[email password phone avatar])
    end

    def employer_params_update
      params.require(:employer).permit(:name, :address, :company_size, :description, :website,
                                       account_attributes: %i[email phone avatar])
    end

    def set_employer
      @employer = Employer.find_by(id: params[:id])
    end
  end
end
