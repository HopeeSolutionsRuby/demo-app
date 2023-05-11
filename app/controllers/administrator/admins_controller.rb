# frozen_string_literal: true

module Administrator
  class AdminsController < Administrator::BaseController
    include BreadcrumbsOnRails::ActionController

    before_action :authorize_admin
    before_action :set_admin, only: %i[show edit update destroy]

    add_breadcrumb 'Home', :administrator_root_path
    add_breadcrumb 'Admins', :administrator_admins_path

    def index
      @admins = Admin.all
      if params[:search].present?
        @admins = @admins.where("CONCAT(first_name, ' ', last_name) LIKE ? OR email LIKE ?",
                                "%#{params[:search]}%", "%#{params[:search]}%")
      end
      @admins = @admins.paginate(page: params[:page], per_page: 10)
    end

    def show
      add_breadcrumb 'Admin informations'
    end

    def new
      add_breadcrumb 'Add new admin'
      @admin = Admin.new
    end

    def edit
      add_breadcrumb 'Edit admin'
    end

    def create
      @admin = Admin.new(admin_params)
      if @admin.save
        flash[:success] = I18n.t('flash.admin.success.create')
        redirect_to administrator_admins_path
      else
        render 'new'
      end
    end

    def update
      add_breadcrumb 'Edit admin'
      if @admin.update(admin_params)
        flash[:success] = I18n.t('flash.admin.success.update')
        redirect_to administrator_admin_path(@admin)
      else
        render 'edit'
      end
    end

    def destroy
      @admin.destroy
      redirect_to administrator_admins_path
    end

    private

    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password, :phone)
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def authorize_admin
      authorize current_admin
    end
  end
end
