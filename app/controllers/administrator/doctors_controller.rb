# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/doctors_controller.rb
  class DoctorsController < BaseController
    before_action :assign_doctor, only: %i[show edit update destroy]

    def index
      @doctors = Doctor.all
      @pagy, @paginated_doctors = pagy(@doctors, items: 10)
    end

    def show; end

    def new
      @doctor = Doctor.new
    end

    def edit; end

    def create
      @doctor = Doctor.new(doctor_params)

      respond_to do |format|
        if @doctor.save!
          format.html { redirect_to administrator_doctor_url(@doctor), notice: 'Doctor was successfully created.' }
          format.json { render :show, status: :created, location: @doctor }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @doctor.update(doctor_params)
          format.html { redirect_to administrator_doctor_url(@doctor), notice: 'Doctor was successfully updated.' }
          format.json { render :show, status: :ok, location: @doctor }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @doctor.destroy!

      respond_to do |format|
        format.html { redirect_to administrator_doctors_url, notice: 'Doctor was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def assign_doctor
      @doctor = Doctor.find_by(id: params[:id])
      return if @doctor

      flash[:alert] = "Doctor with ID #{params[:id]} not found."
      redirect_to administrator_doctors_url
    end

    def doctor_params
      params.require(:doctor).permit(:full_name, :age, :email, :gender, :address, :phone_number, :avatar_doctor)
    end
  end
end
