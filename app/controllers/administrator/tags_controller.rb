# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class TagsController < BaseController
    before_action :assign_tag, only: %i[show edit update destroy]

    def index
      @tags = Tag.all
    end

    def show; end

    def new
      @tag = Tag.new
    end

    def edit; end

    def create
      @tag = Tag.new(tag_params)

      if @tag.save
        flash[:notice] = 'Tagging was successfully created.'
        redirect_to administrator_tags_path
      else
        flash[:alert] = "Cannot create the tagging: #{@tag.errors.full_messages.join(', ')}"
        render 'new'
      end
    end

    def update
      if @tag.update(tag_params)
        flash[:notice] = 'Tagging information updated successfully.'
        redirect_to administrator_tags_path
      else
        flash[:alert] = "Cannot update the tagging: #{@tag.errors.full_messages.join(', ')}"
        render 'edit'
      end
    end

    def destroy
      @tag.destroy!

      flash[:notice] = 'Tagging has been deleted successfully.'
      redirect_to administrator_tags_path
    end

    private

    def assign_tag
      @tag = Tag.find_by(id: params[:id])
      return if @tag

      flash[:alert] = "Tag with ID #{params[:id]} not found."
      redirect_to administrator_tags_path
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
  end
end
