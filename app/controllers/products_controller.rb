# frozen_string_literal: true

class ProductsController < ApplicationController
  include PaginationHelper
  skip_before_action :verify_authenticity_token
  def index
    paginate
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).includes(:category).custom_paginate(@page, @per_page).order(id: :desc)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path }
        format.json { render json: @product }
      else
        format.html
        format.json { render json: { errors: @product.errors }, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :category_id, :properties)
    # params.fetch(:product, {})
  end

  def paginate
    @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    @per_page = 15
    @total_pages = total_pages(Product.all.size, @per_page)
    @displayed_pages = get_displayed_pages(@page, @total_pages, 5)
  end
end
