class ApplicationController < ActionController::API
  before_action :validate_api_request

  API_TOKEN = '123qwe'

  def import
    companies_list = Company::CsvParser.parse_file_data_to_struct(params[:file])
    response = Company::CreateCompanyService.new(CompanyRepository).perform(companies_list)

    render status: 200, json: { data: response }
  end

  def integrate_data
    # Receive data -> Treat data
    # Match data
    # update data
    # response
    700.times { puts '***********8' }
  end
  

  def status
    render status: 200, json: { it_works: 'segue o baile' }
  end
  
  private

  def validate_api_request
    return render status: 500 unless API_TOKEN == request.headers['Authorization']
  end
end
