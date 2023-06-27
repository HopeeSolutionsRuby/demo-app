class ProductsController < ApplicationController
  include PaginationHelper

  def index
    @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    per_page = 20
    total_items = Product.all.size
    @total_pages = total_pages(total_items, per_page)
    @displayed_pages = get_displayed_pages(@page, @total_pages, range_per_side = 10)

    @q = Product.includes(:category).ransack(params[:q])
    @products = @q.result(distinct: true).custom_paginate(@page, per_page)

    @csrf_token = form_authenticity_token

    # render json: @products
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      # redirect_to @product
      render json: @product.as_json, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :category_id, :properties)
  end
end
