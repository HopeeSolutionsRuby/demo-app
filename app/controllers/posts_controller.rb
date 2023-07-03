# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
    redirect_to user_path(params[:user_id]) if @post.blank?
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(id: params[:id])
    redirect_to user_path(params[:user_id]) if @post.blank?
  end

  def create
    @post = Post.new(post_param)
    if @post.save
      flash[:notice] = t('flash.notices.create_success')
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_param)
      flash[:notice] = t('flash.notices.update_success')
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = @post.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = t('flash.notices.delete_success')
    else
      flash[:alert] = t('flash.alerts.delete_failure')
    end
    redirect_to user_path(params[:user_id])
  end

  private

  def post_param
    params.permit(:title, :content, :user_id)
  end
end
