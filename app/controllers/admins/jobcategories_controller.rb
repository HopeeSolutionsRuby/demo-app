# frozen_string_literal: true

module Admins
  class JobcategoriesController < ApplicationController
    layout 'admin/layout'
    before_action :set_jobcategory, only: %i[show edit update destroy]

    # GET /jobcategories or /jobcategories.json
    def index
      @jobcategories = Jobcategory.all
      render 'admins/jobcategories/index'
    end

    # GET /jobcategories/1 or /jobcategories/1.json
    def show
      redirect_to admins_jobcategory_path
    end

    # GET /jobcategories/new
    def new
      @jobcategory = Jobcategory.new
    end

    # GET /jobcategories/1/edit
    def edit
      return if @jobcategory

      flash[:error] = "Job category with id #{params[:id]} not found."
      redirect_to admins_jobcategory_path
    end

    # POST /jobcategories or /jobcategories.json
    def create
      @jobcategory = Jobcategory.new(jobcategory_params)

      if @jobcategory.save
        flash[:success] = 'Job category has been created!'
        redirect_to admins_jobcategories_path
      else
        flash[:error] = @jobcategory.errors.full_messages
        redirect_to new_admins_jobcategory_path
      end
    end

    # PATCH/PUT /jobcategories/1 or /jobcategories/1.json
    def update
      if @jobcategory.update(jobcategory_params)
        flash[:success] = 'Job category has been updated!'
        redirect_to admins_jobcategories_path
      else
        flash[:error] = @jobcategory.errors.full_messages
        redirect_to edit_admins_jobcategory_path(@jobcategory)
      end
    end

    # DELETE /jobcategories/1 or /jobcategories/1.json
    def destroy
      @jobcategory.destroy
      redirect_to admins_jobcategories_path, notice: 'Job Category was successfully deleted.'
    end

    private

    def set_jobcategory
      @jobcategory = Jobcategory.find_by(id: params[:id])
    end

    def jobcategory_params
      params.require(:jobcategory).permit(:country, :category_name, :job_category_status, :description)
    end
  end
end

