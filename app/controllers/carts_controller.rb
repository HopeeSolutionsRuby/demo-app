class CartsController < ApplicationController
  def index
    @carts = current_user.carts.all
  end

  def create
    user = current_user
    product_id = params[:product_id]
    @cart = Cart.find_by(product_id: product_id, user_id: user.id)
    if @cart
      @cart.quantity += 1
      @cart.save
    else
      product = Product.find(product_id)
      @cart = Cart.new(cart_params)
      @cart.save
    end
    redirect_to carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path, notice: 'Cart was successfully destroyed.'
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id, :quantity, :user_id, :storage_id)
  end
end
