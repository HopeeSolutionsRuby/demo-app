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
            name: clinic_row['name'],
            address: clinic_row['address'],
            region: clinic_row['region'],
            faculity: clinic_row['faculity'],
          )
        end
        redirect_to administrator_clinics_path, notice: 'Clinic data imported successfully.'
      else
        redirect_to administrator_clinics_path, alert: 'Please upload a valid CSV file.'
      end
    end
  end
end