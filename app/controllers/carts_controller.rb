class CartsController < ApplicationController
  def index
  end

  def show
  user = current_user
  @cart = Cart.find_by(id: params[id:])
  amount = 0
  cart_empty = false
  if cart.exists?
    cart.each do |p|
      if p.product.discounted_price != 0
        value = p.quantity * p.product.discounted_price
        amount += value
        cart_empty = false
      else
        value = p.quantity * p.product.selling_price
        amount += value
        cart_empty = false
      end
    end
  else
    value = 0
    amount += value
    cart_empty = true
  end
  
  total_amount = amount + 40
  
  render 'index', locals: { user: user, cart: cart, amount: amount, cart_empty: cart_empty, total_amount: total_amount }
end


  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
    else
      render :new
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_url, notice: 'Cart was successfully destroyed.'
  end

  private

  def cart_params
    params.require(:cart).permit(:name, :description, :user_id)
  end
end
