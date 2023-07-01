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
    @product = Product.includes(:images, :comments).find(params[:id])
    @categories = Category.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  def new
    @product = Product.new
    @categories = Category.all

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
        flash[:success] = ["Successfully created product with ID: #{@product.id}"]
        format.html { redirect_to products_path, status: :see_other }
        format.json { render json: @product, status: :created, location: @product }
      else
        @categories = Category.all
        flash[:error] = @product.errors.full_messages
        format.html
        format.json { render json: { errors: @product.errors }, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @product = Product.includes(:images, :comments).find(params[:id])
    @categories = Category.all
    # check if any field changed then update.....
    # remeber check
    respond_to do |format|
      format.html
      if @product.update(product_params)
        flash.now[:success] = ['Successfully update product']
        format.json { render json: @product, status: :ok, location: @product }
      else
        flash[:error] = @product.errors.full_messages
        format.json { render json: { errors: @product.errors }, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    # redirect_to products_path, status: :see_other
    respond_to do |format|
      flash[:success] = ["Successfully deleted product with ID: #{@product.id}"]
      format.html { redirect_to products_path, status: :see_other }
      format.json { render json: {}, status: :no_content }
    end
  rescue ActiveRecord::DeleteRestrictionError => e
    respond_to do |format|
      flash[:error] = ["Failed deleted product with ID: #{@product.id}", e.message]
      format.html { redirect_to products_path, status: :see_other }
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :category_id, :properties, :description)
    # params.fetch(:product, {})
  end

  def paginate
    @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    @per_page = 15
    @total_pages = total_pages(Product.all.size, @per_page)
    @displayed_pages = get_displayed_pages(@page, @total_pages, 5)
  end
end
