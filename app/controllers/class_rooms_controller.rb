# frozen_string_literal: true

class ClassRoomsController < ApplicationController
  def index
    @class_rooms = ClassRoom.all
  end

  def show
    @class_room = ClassRoom.find(params[:id])
    @students = @class_room.students
  end

  def new
    @class_room = ClassRoom.new
  end
end
