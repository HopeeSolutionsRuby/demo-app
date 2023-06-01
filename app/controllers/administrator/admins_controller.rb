# frozen_string_literal: true

module Administrator
  class AdminsController < Administrator::BaseController
    include BreadcrumbsOnRails::ActionController

    before_action :authorize_admin, only: %i[index]
    before_action :set_admin, only: %i[show edit update destroy]

    add_breadcrumb 'Home', :administrator_root_path

    def index

    add_breadcrumb 'Admins', :administrator_admins_path
      @admins = Admin.all
      if params[:search].present?
        @admins = @admins.where("CONCAT(first_name, ' ', last_name) LIKE ? OR email LIKE ?",
                                "%#{params[:search]}%", "%#{params[:search]}%")
      end
      @admins = @admins.paginate(page: params[:page], per_page: 10)
    end

    def show
      if current_admin.role == 'admin'    
        add_breadcrumb 'Admins', :administrator_admins_path
      end 
      add_breadcrumb 'Your informations'
    end

    def new
      add_breadcrumb 'Add new admin'
      @admin = Admin.new
    end

    def edit
      if current_admin.role == 'admin'    
        add_breadcrumb 'Admins', :administrator_admins_path
      end
      add_breadcrumb 'Edit your account'
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
      add_breadcrumb 'Edit your account'
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
      params.require(:admin).permit(:avatar, :first_name, :last_name, :email, :phone, :password)
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def authorize_admin
      authorize current_admin
    end
  end
end
