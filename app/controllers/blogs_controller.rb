# frozen_string_literal: true

# Blog controller
class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog_params])
    if @blog.save
      redirect_to blog_path(@blog.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :student_id)
  end
end
