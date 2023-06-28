# frozen_string_literal: true

class ProductsController < ApplicationController
  include PaginationHelper

  def index
    @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    per_page = 14
    total_items = Product.all.size
    @total_pages = total_pages(total_items, per_page)
    @displayed_pages = get_displayed_pages(@page, @total_pages, 10)

    @q = Product.includes(:category).ransack(params[:q])
    @products = @q.result(distinct: true).custom_paginate(@page, per_page)
  
    @csrf_token = form_authenticity_token
    respond_to do |format|
      format.html # Render the HTML view as usual
      format.json { render json: @products } # Respond with JSON data for AJAX request
    end
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: t('notices.product_created') }
        format.json { render :show, status: :created, location: @discount }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def product_params
    # params.require(:product).permit(:name, :price, :quantity, :category_id, :properties)
    params.fetch(:product, {})
  end
end
