class ProductsController < ApplicationController
	include BreadcrumbsOnRails::ActionController
	before_action :set_category, only: %i[new create update edit]
	before_action :set_product, only: %i[edit update destroy]

	def index
		@products = Product.all
    categories = Category.find_by(id: params[:category_id])
    if params[:search].present?
    @products = @products.joins(:category).where("CONCAT(products.price, ' ', products.discount_price) LIKE ?
                OR products.name LIKE ? OR categories.name LIKE ?",
                "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end
    @products = @products.paginate(page: params[:page], per_page: 10)

    render 'index'
	end

	def new
		@product = Product.new
	end

	def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = I18n.t('flash.product.success.create')
      redirect_to products_path
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = I18n.t('flash.admin.success.update')
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
  	@product.destroy
  end

  private

  def set_category
    @categories = Category.all
  end 

  def product_params
	  params.require(:product).permit(:name, :price, :discount_price, :description, :category_id, images: [])
	end

	def set_product
		@product = Product.find(params[:id])
	end

end
