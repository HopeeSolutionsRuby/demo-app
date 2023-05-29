class CartsController < ApplicationController
  def index
    carts = Cart.all
    @cart = current_user.carts.includes(:product)
    product = Product.find_by(id: params[:id])
    @amount = 0
    cart_empty = false
    if @cart.exists?
      @cart.each do |p|
        if p.product.discount_price != 0
          value = p.quantity * p.product.discount_price
          @amount += value
          cart_empty = false
        else
          value = p.quantity * p.product.price
          @amount += value
          cart_empty = false
        end
      end
    else
      value = 0
      @amount += value
      cart_empty = true
    end
    @totalamount = @amount + 40
  end

  def create
    carts = Cart.all
    @cart = current_user.carts.includes(:product)
    product = Product.find_by(id: params[:id])
    if Cart.exists?(product: product_id)
      c = Cart.find_by(product: product_id, user: request.user)
      c.quantity += 1
      c.save
      amount = 0
      redirect '/cart'
    else
      product = Product.find(product_id)
      Cart.create(user: user, product: product)
      redirect '/cart'
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
