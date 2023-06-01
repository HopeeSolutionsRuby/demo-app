class CategoriesController < ApplicationController
  include BreadcrumbsOnRails::ActionController
  before_action :set_category, only: %i[update edit destroy]
  before_action :find_category, only: %i[index new create]
  def index
    @categories = Category.all
    @categories = @categories.paginate(page: params[:page], per_page: 10)

    render 'categories/index'
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = I18n.t('flash.product.success.create')
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = I18n.t('flash.admin.success.update')
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
  end

  private

  def find_category
    @categories = Category.find_by(id: params[:category_id])
  end 

  def category_params
    params.require(:category).permit(:name, :images)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
