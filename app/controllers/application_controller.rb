class ApplicationController < ActionController::API
  before_action :validate_api_request

  API_TOKEN = '123qwe'

  def import
    companies_list = parse_csv_file.map do |company|
      Serializers::CompanySerializer.treat_data(company)
    end

    response = Company::CreateCompanyService.new(company_repository).perform(companies_list)

    render status: 200, json: { data: response }
  end

  def integrate_data
    companies_list = parse_csv_file.map do |company|
      Serializers::CompanySerializer.treat_data(company)
    end

    # reponse = AggregateCompanyDataService.new(company_repository).perform
    # Match data
    # update data
    # response
  end


  def status
    render status: 200, json: { it_works: 'segue o baile' }
  end

  private

  def parse_csv_file
    Company::CsvParser.parse_file_data_to_struct(params[:file])
  end

  def company_repository
    CompanyRepository
  end

  def validate_api_request
    return render status: 500 unless API_TOKEN == request.headers['Authorization']
  end
end
