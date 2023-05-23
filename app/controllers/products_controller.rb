class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all

    render 'index'
  end

  def show
  end

  def edit
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @product = @cart.products.build(product: product)

    if @product.save
      redirect_to @product.cart, notice: 'Line item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Line item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Line item was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:product_id, :cart_id)
  end
end
