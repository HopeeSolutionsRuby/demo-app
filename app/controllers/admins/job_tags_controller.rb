# frozen_string_literal: true

module Admins
  class JobTagsController < ApplicationController
    layout 'admin/layout'
    before_action :set_job_tag, only: %i[show edit update destroy]

    def index
      @job_tags = JobTag.all
      render 'admins/job_tags/index'
    end

    def show; end

    def new
      @job_tag = JobTag.new
    end

    def edit
      @job_tags = JobTag.all
    end

    # POST /job_tags or /job_tags.json
    # def create
    #   @job_tag = JobTag.new(job_tag_params)

    #   respond_to do |format|
    #     if @job_tag
    #       format.html { redirect_to admins_job_tags_path, notice: "Job tag was successfully created." }
    #       format.json { render json: @job_tag, status: :created }
    #     else
    #       flash[:notice] = 'invalid'
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @job_tag.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # PATCH/PUT /job_tags/1 or /job_tags/1.json
    # def update
    #   if @job_tag.update(job_tag_params_update)
    #     redirect_to admins_job_tags_path, notice: 'Job tag was successfully updated'
    #   else
    #     Rails.logger.debug @job_tag.errors.full_messages
    #     flash[:notice] = 'Invalid job tag information'
    #     render :edit
    #   end
    # end

    # DELETE /job_tags/1 or /job_tags/1.json
    def destroy
      @job_tag.destroy
      redirect_to admins_job_tags_path, notice: 'Job Tag was successfully deleted'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_job_tag
      @job_tag = JobTag.find(params[:id])
    end

    def job_tag_params_update
      params.require(:job_tag).permit(:country, :job_id, :job_category_id, :description)
    end

    # Only allow a list of trusted parameters through.
    def job_tag_params
      params.require(:job_tag).permit(:country, :description)
    end
  end
end
