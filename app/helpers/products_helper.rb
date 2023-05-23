module ProductsHelper
  def add_to_cart(product)
    product[:product_id] = product.id
  end

  def current_cart
    @current_cart ||= Cart.find_by(id: cart[:cart_id])
  end
end
