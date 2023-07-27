# frozen_string_literal: true

module Admins
  class JobTagsController < ApplicationController
    layout 'admin/layout'
    before_action :set_job_tag, only: %i[show edit update destroy]

    def index
      @job_tags = JobTag.all
      # render 'admins/job_tags/index'
    end

    def show
      # Already set in before_action, no need to find again.
      respond_to do |format|
        format.html # renders show.html.erb by default
      end
    end

    def new
      @job_tag = JobTag.new
    end

    def edit
      return if @job_tag

      flash[:error] = "Not found your path with id #{params[:id]}"
      redirect_to admins_job_tag_path
    end

    # POST
    def create
      job_tag = JobTag.new(job_tag_params)

      if job_tag.save
        redirect_to admins_job_tags_path, notice: 'Job tag was successfully created.'
      else
        Rails.logger.debug job_tag.errors.full_messages
        flash[:notice] = 'Invalid job tag information'
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @job_tag.update(job_tag_params_update)
        flash[:success] = 'Job tag was successfully updated!'
        redirect_to admins_job_tags_path
      else
        flash[:error] = @job_tag.errors.full_messages
        redirect_to edit_admins_job_tag_path
      end
    end

    # DELETE
    def destroy
      @job_tag.destroy
      redirect_to admins_job_tags_path, notice: 'Job Tag was successfully deleted.'
    end

    private

    def set_job_tag
      @job_tag = JobTag.find(params[:id])
    end

    def job_tag_params_update
      params.require(:job_tag).permit(:country, :job_id, :job_category_id, :description)
    end

    def job_tag_params
      params.require(:job_tag).permit(:country, :job_id, :job_category_id, :description)
    end
  end
end
