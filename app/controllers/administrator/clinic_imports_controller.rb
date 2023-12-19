require 'csv'
module Administrator
  class ClinicImportsController < BaseController
    def new
    end

    def create
      uploaded_file = params[:csv_file]

      if uploaded_file.present? && uploaded_file.content_type == 'text/csv'
        clinics_data = CSV.read(uploaded_file.path, headers: true)
        clinics_data.each do |clinic_row|
          Clinic.create!(
            name: clinic_row['Name'],
            address: clinic_row['Address'],
            region: clinic_row['Region'],
            faculity: clinic_row['Faculity'],
          )
        end
        redirect_to administrator_clinics_path, notice: 'Clinic data imported successfully.'
      else
        redirect_to administrator_clinics_path, alert: 'Please upload a valid CSV file.'
      end
    end
  end
end