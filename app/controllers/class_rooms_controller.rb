# frozen_string_literal: true

class ClassRoomsController < ApplicationController
  before_action :find_class_room, only: %i[edit update destroy]
  include Pagy::Backend
  def index
    @q = ClassRoom.ransack(params[:q])
    @class_rooms = @q.result(distinct: true)
  end

  def show
    @class_room = ClassRoom.find_by(params[:id])
    @students = @class_room.students
    @pagy, @students = pagy(@students, items: 7)
    redirect_to class_rooms_path if @class_room.blank?
  end

  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.new(class_room_params)
    if @class_room.save
      flash[:notice] = 'Created successfully!!'
      redirect_to class_rooms_path
    else
      flash[:errors] = 'Invalid infomation to create'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @class_room.update(class_room_params)
      flash[:notice] = 'Updated successfully!!'
      redirect_to class_rooms_path
    else
      flash[:errors] = 'Invalid infomation to update'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @class_room.destroy
      flash[:notice] = 'Delete successfully!!'
      redirect_to class_rooms_path
    else
      flash[:errors] = 'Invalid infomation to update'
    end
  end

  private

  def class_room_params
    params.require(:class_room).permit(:name, :location)
  end

  def find_class_room
    @class_room = ClassRoom.find(params[:id])
  end
end
