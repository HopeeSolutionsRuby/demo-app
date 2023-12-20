module Administrator
  class ClinicExportsController < BaseController
    def index
      csv = ExportCsvService.new Clinic.all, Clinic::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.perform, filename: "clinics.csv" }
      end
    end
  end
end
