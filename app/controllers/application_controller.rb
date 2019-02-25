require 'csv'

class ApplicationController < ActionController::API
  before_action :validate_api_request

  API_TOKEN = '123qwe'

  def import
    render status: 200, json: { data: parse_csv_data }
  end
  
  def parse_csv_data
    CSV.parse(params[:file].read)
  end

  def create_company_record(company_struct)
    
  end

  def create_companies_service
    
  end
  
  def data_treatment
    
  end
  
  
  def status
    render status: 200, json: { it_works: 'works' }
  end
  
  private

  def validate_api_request
    return render status: 500 unless API_TOKEN == request.headers['Authorization']
  end
end
